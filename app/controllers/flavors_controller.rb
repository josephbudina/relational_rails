class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.where(in_stock: true)
  end

  def show
    @flavors = Flavor.find(params[:id])
  end

  def new
    @parlors = IceCreamParlor.find(params[:id])
  end

  def edit
    @flavors = Flavor.find(params[:id])
  end

  def update
    flavor = Flavor.find(params[:id])

    flavor.update(flavor_params)
    flavor.save

    redirect_to "/flavors/#{flavor.id}"
  end

  def destroy
    Flavor.destroy(params[:id])
    redirect_to "/flavors"
  end

  private
  
  def flavor_params
    params[:flavor].permit(:name, :flavor_rating, :in_stock)
  end
end