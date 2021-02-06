class CoffeeRoastsController < ApplicationController
  def index
    @roasts = CoffeeRoast.all.is_fresh?
  end

  def show
    @roast = CoffeeRoast.find(params[:id])
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
