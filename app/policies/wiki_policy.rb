class WikiPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    # scope.where(:id => record.id).exists?
    
    if !@wiki.private?
      Rails.logger.info ">>>> #{@user.present?}"
      @user.present?
    elsif @wiki.private?
      Rails.logger.info ">>>> #{@user.id == @wiki.user_id}, #{@user.admin?}"
      (@user.id == @wiki.user_id) || @user.admin?
    end
  end

  def create?
    @user.present?
  end

  def new?
    create?
  end

  def update?
    (@user.present? && !@wiki.private) || (@user.admin? || (@user.id == @wiki.user_id))
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin? || (@user.id == @wiki.user_id)
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
