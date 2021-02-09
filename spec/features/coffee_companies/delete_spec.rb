require 'rails_helper'

RSpec.describe 'The coffee company delete', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies/:id" do
      it "I can see a button to delete the coffee company" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        roast1 = company_1.coffee_roast.create!(name: 'Pinnacle',
                                  origin: 'test',
                                  elevation: 1000,
                                  fresh: true)
        roast2 = company_1.coffee_roast.create!(name: 'Ouachita',
                                  origin: 'test 2',
                                  elevation: 2000,
                                  fresh: true)

        visit "/coffee_companies/#{company_1.id}"
        click_button("Delete Coffee Company")

        expect(current_path).to eq ("/coffee_companies")

        expect(page).to_not have_content('Round Mountain Coffee')
      end
    end
  end
end
