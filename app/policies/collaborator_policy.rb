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
    # attr_reader :user, :scope
    
    # def initialize(user, scope)
    #   @user = user
    #   @scope = scope
    # end
    
    # def resolve
    #   users = []
      
    #   if scope.private? && ( user.admin? || user.id == scope.wiki.user_id || scope.users.include?(user) )
    #     users = User.all
    #   end
    #   users
    # end
  end
end
