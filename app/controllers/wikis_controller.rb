class WikisController < ApplicationController
    before_action :get_wiki_by_id, only: [:show, :edit, :update, :destroy]
    
    def index
        @wikis = Wiki.all
    end
    
    def show
    end
    
    def new
        @wiki = Wiki.new
        authorize @wiki
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        @wiki.user = current_user
        
        authorize @wiki
        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to [@wiki]
        else
            flash.now[:alert] = "There was an error saving the wiki. Please try again."
            render :new
        end
    end
    
    def edit
        authorize @wiki
    end
    
    def update
        @wiki.assign_attributes(wiki_params)
        authorize @wiki
        
        if @wiki.save
            flash[:notice] = "#{@wiki.title} was updated successfully!"
            redirect_to @wiki 
        else
            flash.now[:alert] = "There was an error saving your changes. Please try again."
            render :edit
        end
    end
    
    def destroy
        authorize @wiki
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the post."
            render :show
        end
    end
    
    private
    
    def wiki_params
        params.require(:wiki).permit(:title, :body, :private)
    end
    
    def get_wiki_by_id
        @wiki = Wiki.find(params[:id])
    end
end
