class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new(params[:id])
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(book_params)
    if @book.save
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]).delete
  end

  private

  def book_params
    params.require(:book).permit(:title, :cover, :publisher, :description, :author_id, :year_id)
  end
end
