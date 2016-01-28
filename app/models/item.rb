class Item < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  belongs_to :user

  def time_left
    if self.created_at > (Time.now - 7.days)
      distance_of_time_in_words(self.created_at, (Time.now - 7.days), include_seconds: true)
    else
      "Overdue: " + distance_of_time_in_words(self.created_at, Time.now - 7.days, include_seconds: true)
    end

  end
end
