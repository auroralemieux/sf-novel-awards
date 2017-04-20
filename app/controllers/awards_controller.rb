class AwardsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @awards = Award.order("#{sort_column} #{sort_direction}")
    @hugos = Award.where(award_type: "Hugo").order("#{sort_column} #{sort_direction}")
    @nebulas = Award.where(award_type: "Nebula").order("#{sort_column} #{sort_direction}")
    @auroras = Award.where(award_type: "Aurora").order("#{sort_column} #{sort_direction}")
    @categories = {"Hugo" => @hugos, "Nebula" => @nebulas, "Aurora" => @auroras}

    respond_to do |format|
      format.html
      format.csv { send_data @awards.to_csv }
    end
  end

  def show
    @award = Award.find(params[:id])
  end

  def new
    @award = Award.new(params[:id])
  end

  def create
    @award = Award.create(award_params)
    if @award.save
      redirect_to awards_path
    else
      render :new
    end
  end

  def edit
    @award = Award.find(params[:id])
  end

  def update
    @award = Award.find(params[:id])
    if @award.update(award_params)
      redirect_to awards_path
    else
      render :edit
    end
  end

  def destroy
    @award = Award.find(params[:id]).destroy
    redirect_to years_path
  end

  # def sort_by_awards
  #   @awards = Award.sort_by_total_awards
  #   redirect_to awards_path
  # end

  private

  def sortable_columns
    ["year.year", "book.title"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "year.year"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def award_params
    params.require(:award).permit(:award_type, :year_id, :book_id)
  end
end
