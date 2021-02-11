class IceCreamParlorsController < ApplicationController
  def index
    @parlors = IceCreamParlor.all.order_by_created_date
  end

  def new
  end
  
  def show
    @parlors = IceCreamParlor.find(params[:id])
    @flavor_count = @parlors.flavors.flavor_count
  end

  def create
    parlor = IceCreamParlor.new({
      name: params[:ice_cream_parlor][:name],
      open: params[:ice_cream_parlor][:open],
      street_number: params[:ice_cream_parlor][:street_number]
    })
    
    parlor.save
    redirect_to '/ice_cream_parlors'
  end

  def edit
    @parlors = IceCreamParlor.find(params[:id])
  end

  def update
    parlor = IceCreamParlor.find(params[:id])
    parlor.update({
      name: params[:ice_cream_parlor][:name],
      open: params[:ice_cream_parlor][:open],
      street_number: params[:ice_cream_parlor][:street_number]
    })

    parlor.save
    redirect_to "/ice_cream_parlors/#{parlor.id}"
  end

  def destroy
    parlor = IceCreamParlor.find(params[:id])
    parlor.flavors.each do |flavor|
      flavor.destroy
    end
    redirect_to '/ice_cream_parlors'
  end
end