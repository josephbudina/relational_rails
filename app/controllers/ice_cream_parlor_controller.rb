class IceCreamParlorController < ApplicationController
  def index
    @flavors = ['Vanilla', 'Chocolate']
  end
end