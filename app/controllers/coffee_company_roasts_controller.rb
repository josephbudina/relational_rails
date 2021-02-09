class CoffeeCompanyRoastsController < ApplicationController
  def index
    if !params[:elevation_number].nil?
      elevation_number = params[:elevation_number]
      @company = CoffeeCompany.find(params[:id])
      @roasts = @company.filter_by_elevation(elevation_number)
    else
      @company = CoffeeCompany.find(params[:id])
      if !params[:alphabetical].nil?
        @roasts = @company.order_alphabetically
      else
        @roasts = @company.coffee_roast
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
    if params[:fresh].nil?
      params[:fresh] = false
    end

    roast = CoffeeRoast.create!({
      name: params[:name],
      coffee_company_id: params[:id],
      origin: params[:origin],
      elevation: params[:elevation],
      fresh: params[:fresh],
      })
    redirect_to "/coffee_companies/#{params[:id]}/coffee_roasts"
  end

  private

  def coffee_roast_params
    params.permit(:name, :origin, :elevation, :fresh)
  end
end
