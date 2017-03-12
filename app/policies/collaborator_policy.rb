class CollaboratorPolicy < ApplicationPolicy
  def index?
    record.wiki.private? && ( user.admin? || user.id == record.wiki.user_id || record.users.include?(user) )
  end

  def create?
    user.admin? || user.id == record.wiki.user_id
  end
  
  def destroy?
    user.admin? || user.id == record.wiki.user_id
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
