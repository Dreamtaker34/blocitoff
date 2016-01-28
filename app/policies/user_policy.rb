class UserPolicy < ApplicationPolicy
  def show?
    user == record || user.admin?
  end
end
