require 'rails_helper'

RSpec.describe 'The coffee company index page', type: :feature do
  it "can see each coffee company" do
    company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                     address: "123 Prince St",
                                     zipcode: 72034,
                                     local: true)
    company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                     address: "123 W St",
                                     zipcode: 72712,
                                     local: false)

    visit '/coffee_companies'

    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)

    expect(page).to have_link('New Coffee Company')
  end
end
