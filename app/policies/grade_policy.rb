class GradePolicy < ApplicationPolicy

  def index?
    user.has_role? [:admin, :teacher]
  end


  def show?
    index?
  end

  def create?
    index?
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
