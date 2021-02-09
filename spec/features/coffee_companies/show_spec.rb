require 'rails_helper'

RSpec.describe 'The coffee company show page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies/:id" do
      it "I can see the coffee company and its attributes" do
        CoffeeCompany.destroy_all
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)

        visit '/coffee_companies'
        click_link("Round Mountain Coffee")

        expect(current_path).to eq("/coffee_companies/#{company_1.id}")

        expect(page).to have_content('Round Mountain Coffee')
        expect(page).to have_content("Address: #{company_1.address}")
        expect(page).to_not have_content(company_2.name)
        expect(page).to have_content("Local?")
      end

      it "can see no coffee companies if there are none" do
        CoffeeCompany.destroy_all
        visit '/coffee_companies'
        expect(page).to have_content('Coffee Companies')
        expect(page).to have_content('No Coffee Companies!')
      end
      it "I can see a count of the number of coffee roasts associated with this company" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        company_1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                      address: '2850 Prince St.',
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
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)

        visit '/coffee_companies'
        click_link("Round Mountain Coffee")

        expect(current_path).to eq("/coffee_companies/#{company_1.id}")
        expect(page).to have_content("Number of Coffee Roasts: 2")

        visit '/coffee_companies'
        click_link("Onyx Coffee Labs")

        expect(current_path).to eq("/coffee_companies/#{company_2.id}")
        expect(page).to have_content("Number of Coffee Roasts: 0")
      end
    end
  end
end
