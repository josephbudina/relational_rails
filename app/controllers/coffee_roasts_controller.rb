class CoffeeRoastsController < ApplicationController
  def index
    @roasts = CoffeeRoast.all.fresh?
  end

  def show
    @roast = CoffeeRoast.find(params[:id])
  end

  def edit
    @roast = CoffeeRoast.find(params[:id])
  end

  def update
    roast = CoffeeRoast.find(params[:id])

    roast.update(coffee_roast_params)
    roast.save

    redirect_to "/coffee_roasts/#{roast.id}"
  end

  def destroy
    CoffeeRoast.destroy(params[:id])
    redirect_to "/coffee_roasts"
  end

  private

  def coffee_roast_params
    params[:coffee_roast].permit(:name, :origin, :elevation, :fresh)
  end
end
