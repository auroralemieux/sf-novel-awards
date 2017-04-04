class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new(params[:id])
  end

  def create
    @author = Author.create(author_params)
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
    @author = Author.update(author_params)
    if @author.save
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id]).delete
  end

  private

  def author_params
      params.require(:author).permit(:first_name, :last_name, :birth_year, :death_year, :birth_place)
  end
end
