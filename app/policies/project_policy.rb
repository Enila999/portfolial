class ProjectPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < Scope
    def resolve
      # Si l'utilisateur est admin, il voit tout
      if user&.admin?
        scope.all
      else
        # Sinon, tout le monde peut voir tous les projets (publics)
        scope.all
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end
end
