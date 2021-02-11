class CoffeeCompaniesController < ApplicationController
  def index
    if params[:order_by_roasts].nil?
      @companies = CoffeeCompany.all.order_by_created_date
    else
      @companies = CoffeeCompany.all.order_by_roast_count
      @show_roasts = true
    end
  end

  def show
    @company = CoffeeCompany.find(params[:id])
    @roast_count = @company.coffee_roast.count_of_roasts
  end

  def new
  end

  def create
    company = CoffeeCompany.create(new_params)
    redirect_to "/coffee_companies"
  end

  def edit
    @company = CoffeeCompany.find(params[:id])
  end

  def update
    company = CoffeeCompany.find(params[:id])
    company.update(company_params)
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

  private

  def new_params
    params.permit(:name, :address, :zipcode, :local)
  end

  def company_params
    params[:coffee_company].permit(:name, :address, :zipcode, :local)
  end
end
