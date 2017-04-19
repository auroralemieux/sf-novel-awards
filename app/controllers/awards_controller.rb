class AwardsController < ApplicationController
  def index
    @hugos = Award.where(award_type: "Hugo")
    @nebulas = Award.where(award_type: "Nebula")
    @auroras = Award.where(award_type: "Aurora")
    @awards = {"Hugo" => @hugos, "Nebula" => @nebulas, "Aurora" => @auroras}

# User.joins(:pets).where("pets.name != ?", "fluffy")

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

  def award_params
    params.require(:award).permit(:award_type, :year_id, :book_id)
  end
end
