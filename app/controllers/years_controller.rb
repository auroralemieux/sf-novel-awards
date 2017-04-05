class YearsController < ApplicationController
  def index
    @years = Year.all.order(:year)
  end

  def show
    @year = Year.find(params[:id])
  end

  def new
    @year = Year.new(params[:id])
  end

  def create
    @year = Year.create(year_params)
    if @year.save
      redirect_to years_path
    else
      render :new
    end
  end

  def edit
    @year = Year.find(params[:id])
  end

  def update
    @year = Year.find(params[:id])
    if @year.update(year_params)
      redirect_to years_path
    else
      render :edit
    end
  end

  def destroy
    @year = Year.find(params[:id]).destroy
    redirect_to years_path
  end

  private

  def year_params
      params.require(:year).permit(:year)
  end
end
