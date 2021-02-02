class IceCreamParlorController < ApplicationController
  def index
    @flavors = ['Vanilla', 'Chocolate']
  end

  def new
  end
end