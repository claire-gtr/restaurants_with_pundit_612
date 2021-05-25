class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Restaurant.all
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   #record # argument passed to the authorize method in the controller
  #   #user # current_user of devise
  #   # if record.user == user
  #   #   true
  #   # else
  #   #   false
  #   # end
  #   record.user == user
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

end










