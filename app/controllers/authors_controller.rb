class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:last_name)

    if params[:author_search]
      @authors = @authors.author_search(params[:author_search]).order("created_at DESC")
    else
      @authors = @authors.all.order("created_at DESC")
    end

    respond_to do |format|
      format.html
      format.csv { send_data @authors.to_csv }
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new(params[:id])
  end

  def create
    @author = Author.create(author_params)
    @author.full_name = "#{@author.first_name} #{@author.last_name}"
    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id]).destroy
    redirect_to years_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :birth_year, :death_year, :birth_place)
  end
end
