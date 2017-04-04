class YearsController < ApplicationController
  def index
    @years = Year.all
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
    @year = Year.update(year_params)
    if @year.save
      redirect_to years_path
    else
      render :edit
    end
  end

  def destroy
    @year = Year.find(params[:id]).delete
  end

  private

  def year_params
      params.require(:year).permit(:year)
  end
end
