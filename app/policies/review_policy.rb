class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  # def show?
  #   user.present?
  # end
  def new?
    true
  end

  def create?
    true
  end

  def edit
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
# the expression "user == record.user" means that the program is checking whether the user currently accessing or modifying the record is the same as the user who originally created or owns that record.
