class CoffeeCompaniesController < ApplicationController
  def index
    @companies = CoffeeCompany.all.order_by_created_date
  end

  def show
    @company = CoffeeCompany.find(params[:id])
    @roast_count = @company.coffee_roast.count_of_roasts
  end

  def new
  end

  def create
    if params[:company][:local].nil?
      params[:company][:local] = false
    end
    company = CoffeeCompany.create({
      name: params[:company][:name],
      address: params[:company][:address],
      zipcode: params[:company][:zipcode],
      local: params[:company][:local],
      })
    redirect_to "/coffee_companies"
  end

  def edit
    @company = CoffeeCompany.find(params[:id])
  end

  def update
    if params[:company][:local].nil?
      params[:company][:local] = false
    end
    company = CoffeeCompany.find(params[:id])

    company.update({
      name: params[:company][:name],
      address: params[:company][:address],
      zipcode: params[:company][:zipcode],
      local: params[:company][:local]
      })
    company.save

    redirect_to "/coffee_companies/#{company.id}"
  end

  def destroy
    company = CoffeeCompany.find(params[:id])
    company.coffee_roast.each do |roast|
      roast.destroy
    end

    CoffeeCompany.destroy(params[:id])
    redirect_to "/coffee_companies"
  end
end
