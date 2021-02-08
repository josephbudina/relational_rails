class CoffeeCompanyRoastsController < ApplicationController
  def index
    if !params[:elevation_number].nil?
      elevation_number = params[:elevation_number]
      @company = CoffeeCompany.find(params[:id])
      @roasts = company.filter_by_elevation(elevation_number)
    else
      if !params[:alphabetical].nil?
        @roasts = CoffeeCompany.find(params[:id]).order_alphabetically
      else
        @roasts = CoffeeCompany.find(params[:id]).coffee_roast
      end
    end
  end

  def show
    @company = CoffeeCompany.find(params[:id])
    @roast_count = @company.coffee_roast.count_of_roasts
  end

  def new
    @company = CoffeeCompany.find(params[:id])
  end

  def create
    CoffeeRoast.create!(coffee_roast_params)
    redirect_to "/coffee_companies/#{params[:id]}/coffee_roasts"
  end

  private

  def coffee_roast_params
    params.permit(:name, :origin, :elevation, :fresh)
  end
end
