class BooksController < ApplicationController
  def index
    @books = Book.all.order(:award)

    respond_to do |format|
      format.html
      format.csv { send_data @books.to_csv }
    end

    if params[:search]
      @books = @books.search(params[:search]).order("created_at DESC")
    else
      @books = @books.all.order("created_at DESC")
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to years_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :cover, :publisher, :description, :author_id, :year_id, :award)
  end
end
