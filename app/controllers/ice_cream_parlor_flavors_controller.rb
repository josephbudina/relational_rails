class IceCreamParlorFlavorsController < ApplicationController
  def index
    @parlors = IceCreamParlor.find(params[:id])
    if !params[:flavor_rating].nil?
      rating = params[:flavor_rating]
      @flavors = @parlors.flavors.flavor_rating_above(rating)
    else
      if !params[:alphabetical].nil?
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
    if params[:flavor][:in_stock].nil?
      params[:flavor][:in_stock] = false
    end

    flavor = Flavor.create!({
      name: params[:flavor][:name],
      parlor_id: params[:id],
      flavor_rating: params[:flavor][:flavor_rating],
      in_stock: params[:flavor][:in_stock]
      })
    redirect_to "/ice_cream_parlors/#{params[:id]}/flavors"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to "/ice_cream_parlors/#{params[:flavor_id]}/flavors"
  end
end