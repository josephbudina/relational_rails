class IceCreamParlorFlavorsController < ApplicationController
  def index
    if !params[:flavor_rating].nil?
      flavor_rating = params[:flavor_rating]
      parlors = IceCreamParlor.find(params[:id])
      @flavors = parlors.flavor_rating_above(flavor_rating)
    else
      if !params[:alphabetical].nil?
        @flavors = IceCreamParlor.find(params[:id]).order_alphabetically
      else
        @flavors = IceCreamParlor.find(params[:id]).flavors
      end
    end
  end

  def show
    @parlors = IceCreamParlor.find(params[:id])
    @flavor_count = @parlors.ice_cream_parlor.flavor_count
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
end