class PetPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end


  def new?
    create?
  end


  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
