require 'rails_helper'


RSpec.describe 'the coffee company index page', type: :feature do
  it "can do this"
    company_1 = CoffeeCompany.create()
    company_2 = CoffeeCompany.create()

    visit '/coffeecompanies'

    expect(page).to have_content()
  end
end
