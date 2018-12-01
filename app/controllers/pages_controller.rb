class PagesController < ApplicationController
  def index
    # SQL SELECT * FROM PAGES 
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    # renders a page
  end

  def new
    # CREATES NEW PAGE ONLY IN MEMORY NO IN DATABASE
    @page = Page.new
    # renders the form
  end

  def create 
    #Page.create(Title: 'fhf', body: 'hfuhf')
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else 
      render :new

    end
  end

  private 

  def pages_params
    params.require(:page).permit(:title, :body) 

  end
end 

