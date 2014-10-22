class PagesController < ApplicationController
  before_filter :set_page, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  def index
    authorize! :update, Page # Only admin can see the pages index.
    @pages = Page.all

  end


  def show
  end

  def new
    @page = Page.new
  end

 
  def edit
  end


  def create
    @page = Page.new(page_params)

      if @page.save
        redirect_to @page, notice: 'Page was successfully created.' 
      else
        render action: 'new' 
      end
  end

  
  def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed job"
    redirect_to pages_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by_permalink!(params[:id])#.split("/").last)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :permalink, :content, :nav)
    end
end
