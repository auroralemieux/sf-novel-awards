class BooksController < ApplicationController
  def index
    @books = Book.all.order(:title)

    respond_to do |format|
      format.html
      format.csv { send_data @books.to_csv }
    end

    if params[:main_search]
      @books = @books.main_search(params[:main_search]).order("created_at DESC")
    elsif params[:search_description]
      @books = @books.search_description(params[:search_description]).order("created_at DESC")
    elsif params[:author_search]
      @books = @books.author_search(params[:author_search]).order("created_at DESC")
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
    # author = Author.find_by_id(params[:book][:author_id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  # def addauthor
  #   @book = Book.find(params[:id])
  #
  #   Book.author.create(book_id: params[:id], author_id: params[:book][:author_id])
  #
  #
  # end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to years_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :cover, :publisher, :description, author_ids: [])
  end
end
