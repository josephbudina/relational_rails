class CoffeeRoastsController < ApplicationController
  def index
    @roasts = CoffeeRoast.all.is_fresh?
  end

  def show
    @roast = CoffeeRoast.find(params[:id])
  end

  def coffee_company_roasts
    @company = CoffeeCompany.find(params[:id])
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

  def edit
    @roast = CoffeeRoast.find(params[:id])
  end

  def update
    if params[:roast][:fresh].nil?
      params[:roast][:fresh] = false
    end
    roast = CoffeeRoast.find(params[:id])

    roast.update({
      name: params[:roast][:name],
      origin: params[:roast][:origin],
      elevation: params[:roast][:elevation],
      fresh: params[:roast][:fresh]
      })
    roast.save

    redirect_to "/coffee_roasts/#{roast.id}"
  end

  def destroy
    CoffeeRoast.destroy(params[:id])
    redirect_to "/coffee_roasts"
  end
end
