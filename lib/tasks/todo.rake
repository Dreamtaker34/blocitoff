namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    p "Number of expired tasks: #{Item.where("created_at <= ?", Time.now - 7.days).count}"
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    p "Finished removing expired tasks."
  end

end
