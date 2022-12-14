class BookingPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
