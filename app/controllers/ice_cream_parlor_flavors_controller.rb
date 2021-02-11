class IceCreamParlorFlavorsController < ApplicationController
  def index
    @parlors = IceCreamParlor.find(params[:id])
    if params[:flavor_rating]
      rating = params[:flavor_rating]
      @flavors = @parlors.flavors.flavor_rating_above(rating)
    else
      if params[:alphabetical]
        @flavors = @parlors.order_alphabetically
      else
        @flavors = @parlors.flavors
      end
    end
  end

  def new
    @parlors = IceCreamParlor.find(params[:id])
  end

  def create
    if params[:in_stock].nil?
      params[:in_stock] = false
    end

    flavor = Flavor.create!({
      name: params[:name],
      ice_cream_parlor_id: params[:id],
      flavor_rating: params[:flavor_rating],
      in_stock: params[:in_stock]
      })
    redirect_to "/ice_cream_parlors/#{params[:id]}/flavors"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to "/ice_cream_parlors/#{params[:flavor_id]}/flavors"
  end
end