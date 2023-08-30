class LayoutPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def create?
    true
  end

  def duplicate?
    true
  end

  def destroy?
    record.user == user
  end
end
