class FlavorController < ApplicationController
  def index
    @flavors = Flavor.all
  end
end