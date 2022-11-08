class PasswordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    return true if Password.where(user_id: user).size < 5 && user.premium_user == false
    return true if user.premium_user == true
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def update?
    user == record.user
  end
end
