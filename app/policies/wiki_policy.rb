class WikiPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    if !record.private?
      user.present?
    elsif record.private?
      user.id == record.user_id || user.admin? || record.users.include?(user)
    end
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    (user.present? && !record.private?) || user.admin? || user.id == record.user_id || record.users.include?(user)
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
  
  class Scope < Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      wikis = []
      all_wikis = scope.all
      
      
      if user.admin?
        wikis = all_wikis
      else
        all_wikis.each do |wiki|
          if !wiki.private? || (wiki.user == user && user.premium?) || wiki.users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
