class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    user.present?
  end
  def create?
    user.present?
  end

end
