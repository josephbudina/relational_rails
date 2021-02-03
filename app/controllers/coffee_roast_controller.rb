class CoffeeRoastController < ApplicationController
  def index
    @roasts = CoffeeRoast.all
  end

  def show
    @roast = CoffeeRoast.find(params[:id])
  end

  def coffee_company_roasts
    @company = CoffeeCompany.find(params[:id])
  end
end
