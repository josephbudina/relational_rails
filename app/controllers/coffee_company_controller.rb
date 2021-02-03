class CoffeeCompanyController < ApplicationController
  def index
    @companies = CoffeeCompany.all
  end

  def show
    @company = CoffeeCompany.find(params[:id])
  end

  def new
  end

  def create
    CoffeeCompany.create({
      name: params[:company][:name],
      address: params[:company][:address],
      zipcode: params[:company][:zipcode],
      local: params[:company][:local],
      })
    redirect_to "/coffee_company"
  end

  def edit
    @company = CoffeeCompany.find(params[:id])
  end

  def update
    binding.pry
    if params[:company][:local].nil?
      params[:company][:local] = false
    end
    company = CoffeeCompany.find(params[:id])
    binding.pry
    company.update({
      name: params[:company][:name],
      address: params[:company][:address],
      zipcode: params[:company][:zipcode],
      local: params[:company][:local],
      })
    company.save
    redirect_to "/coffee_company/#{company.id}"
  end

  def destroy
    CoffeeCompany.destroy(params[:id])
    redirect_to "/coffee_company"
  end
end
