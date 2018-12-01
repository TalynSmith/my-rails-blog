class PagesController < ApplicationController
# CRUD


# read views all the pages 
  def index
    # SQL SELECT * FROM PAGES 
    @pages = Page.all
  end

  #read views a single page 
  def show
    @page = Page.find(params[:id])
    # renders a page
  end

  # read renders the form for a new page
  def new
    # CREATES NEW PAGE ONLY IN MEMORY NO IN DATABASE
    @page = Page.new
    # renders the form
  end

  # creates, creates a new page 
  def create 
    #Page.create(Title: 'fhf', body: 'hfuhf')
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else 
      render :new

    end
  end

  # read, renders the edit form
  def edit
    @page = Page.find(params[:id])
    #render the edit form
  end
    #update, updates a page 
  def update 
    # looking for a page with a specific id 
    @pages = Page.find(params[:id])

    # updates with new information
    if @page.update(pages_params)
      redirect_to pages_path
    else 
      render :edit 
    end
  end


  # Delete, deletes a single page 
  def destroy 
    # finds and delete page 
    Page.find(params[:id]).destroy
    # take us back to all pages 
    redirect_to pages_path
  end

  private 

  def pages_params
    params.require(:page).permit(:title, :body) 

     end
    
end

