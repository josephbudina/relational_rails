class CoffeeCompanyRoastsController < ApplicationController
  def index
    @company = CoffeeCompany.find(params[:id])
    if params[:elevation_number]
      elevation_number = params[:elevation_number]
      @roasts = @company.filter_by_elevation(elevation_number)
    else
      if params[:alphabetical]
        @roasts = @company.order_alphabetically
      else
        @roasts = @company.coffee_roast
      end
    end
  end

  def new
    @company = CoffeeCompany.find(params[:id])
  end

  def create
    roast = CoffeeRoast.create!({
      name: params[:name],
      coffee_company_id: params[:id],
      origin: params[:origin],
      elevation: params[:elevation],
      fresh: params[:fresh],
      })
    redirect_to "/coffee_companies/#{params[:id]}/coffee_roasts"
  end

  def destroy
    CoffeeRoast.destroy(params[:id])
    redirect_to "/coffee_companies/#{params[:company_id]}/coffee_roasts"
  end
end
