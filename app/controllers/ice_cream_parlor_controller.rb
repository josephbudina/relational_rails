class IceCreamParlorController < ApplicationController
  def index
    @parlors = IceCreamParlor.all
  end

  def new
  end

  def create
    parlor = IceCreamParlor.new({
      name: params[:ice_cream_parlor][:name],
      open: params[:ice_cream_parlor][:open],
      street_number: params[:ice_cream_parlor][:street_number]
    })
    
    parlor.save
    redirect_to '/ice_cream_parlor'
  end

  def show
    @parlors = IceCreamParlor.find(params[:id])
  end
end