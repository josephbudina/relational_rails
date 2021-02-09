class FlavorController < ApplicationController
  def index
    @flavors = Flavor.where(in_stock: true)
  end

  def show
    @flavors = Flavor.find(params[:id])
  end

  def ice_cream_parlor_flavors
    @parlors = IceCreamParlor.find(params[:id])
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
      ice_cream_parlor_id: params[:id],
      flavor_rating: params[:flavor][:flavor_rating],
      in_stock: params[:flavor][:in_stock]
      })
    redirect_to "/ice_cream_parlor/#{params[:id]}/flavor"
  end

  def edit
    @flavors = Flavor.find(params[:id])
  end

  def update
    if params[:flavor][:in_stock].nil?
      params[:flavor][:in_stock] = false
    end
    flavor = Flavor.find(params[:id])

    flavor.update({
      name: params[:flavor][:name],
      flavor_rating: params[:flavor][:flavor_rating],
      in_stock: params[:flavor][:in_stock]
      })
    flavor.save

    redirect_to "/flavor/#{flavor.id}"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to "/flavor"
  end
end