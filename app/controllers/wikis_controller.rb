class WikisController < ApplicationController
    def index
        @wikis = Wiki.all
    end
    
    def show
        @wiki = get_wiki_by_id
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        @wiki.user = current_user
        
        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to [@wiki]
        else
            flash.now[:alert] = "There was an error saving the wiki. Please try again."
            render :new
        end
    end
    
    def edit
        @wiki = get_wiki_by_id
    end
    
    def update
        @wiki = get_wiki_by_id
        @wiki.assign_attributes(wiki_params)
        
        if @wiki.save
            flash[:notice] = "#{@wiki.title} was updated successfully!"
            redirect_to @wiki 
        else
            flash.now[:alert] = "There was an error saving your changes. Please try again."
            render :edit
        end
    end
    
    def destroy
        @wiki = get_wiki_by_id
        
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
        Wiki.find(params[:id])
    end
end
