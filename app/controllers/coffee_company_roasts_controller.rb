class CoffeeCompanyRoastsController < ApplicationController
  def index
    if !params[:elevation_number].nil?
      elevation_number = params[:elevation_number]
      company = CoffeeCompany.find(params[:id])
      @roasts = company.filter_by_elevation(elevation_number)
    else
      @roasts = CoffeeCompany.find(params[:id]).coffee_roast
      if !params[:alphabetical].nil?
        @roasts = CoffeeCompany.find(params[:id]).order_alphabetically
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
    if params[:roast][:fresh].nil?
      params[:roast][:fresh] = false
    end

    roast = CoffeeRoast.create!({
      name: params[:roast][:name],
      coffee_company_id: params[:id],
      origin: params[:roast][:origin],
      elevation: params[:roast][:elevation],
      fresh: params[:roast][:fresh],
      })
    redirect_to "/coffee_companies/#{params[:id]}/coffee_roasts"
  end
end
