class WikisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wikis = Wiki.all
  end

  def show
      @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Your wiki was saved successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your wiki. Please try again later."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end


    def destroy
      @wiki = Wiki.find(params[:id])
      
      if @wiki.destroy
        flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
        redirect_to wikis_path
      else
        flash.now[:alert] = "There was an error deleting the wiki."
        render :show
      end
    end
  end
  
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end