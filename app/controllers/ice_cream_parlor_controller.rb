class IceCreamParlorController < ApplicationController
  def index
    @flavors = IceCreamParlor.all
  end

  def new
  end
end