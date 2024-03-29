class BoardPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def show?
      true
    end

    def update?
      record.user == user
    end

    def create?
      !user.nill?
    end

    def destroy?
      record.user == user
    end
  end
end
