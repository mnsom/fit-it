class RegisteredItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user == record.layout.user
  end

  def update?
    user == record.layout.user
  end

  def destroy?
    user == record.layout.user
  end
end
