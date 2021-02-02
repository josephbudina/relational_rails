class CoffeeCompanyController < ApplicationController
  def index
  end

  def companies
    @companies = CoffeeCompany.all
  end
end
