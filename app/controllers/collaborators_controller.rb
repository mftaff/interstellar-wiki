class CollaboratorsController < ApplicationController
  before_action :set_wiki
  
  def index
    @users = User.all
    authorize @wiki.collaborators.new(user_id: params[:user_id])
  end
  
  def create
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])
    
    authorize @collaborator
    if @collaborator.save
      flash[:notice] = "#{@collaborator.user.username} was added as a collaborator."
    else
      flash[:alert] = "There was a problem while saving a new collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end
  
  def destroy
    @collaborator = @wiki.collaborators.find(params[:id])
    
    authorize @collaborator
    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.username} was removed from being a collaborator."
    else
      flash[:alert] = "There was a problem removing a collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end
  
  private
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
