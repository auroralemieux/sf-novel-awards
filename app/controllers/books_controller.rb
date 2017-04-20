class BooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @books = Book.order("#{sort_column} #{sort_direction}")
    respond_to do |format|
      format.html
      format.csv { send_data @books.to_csv }
    end

    if params[:main_search]
      @books = @books.main_search(params[:main_search]).order("created_at DESC")
    elsif params[:search_description]
      @books = @books.search_description(params[:search_description]).order("created_at DESC")
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

  def destroy
    @book = Book.find(params[:id])
    @book.awards.each do |award|
      award.destroy
    end
    @book.destroy
    redirect_to years_path
  end

  private

  def sortable_columns
    ["title", "author"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def book_params
    params.require(:book).permit(:title, :cover, :publisher, :description, author_ids: [])
  end
end
