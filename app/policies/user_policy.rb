class UserPolicy < ApplicationPolicy

  def index?
    user.role.to_sym == :admin
  end

  def show?
    index?
  end

  def create?
    new?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    update?
  end

  def destroy?
    index?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
