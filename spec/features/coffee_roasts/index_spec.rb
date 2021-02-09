require 'rails_helper'

RSpec.describe 'Coffee roast index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_roasts" do
      it "I can see each coffee roast" do
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

        visit '/coffee_roasts'
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_link(roast1.name)
        expect(page).to have_link(roast2.name)
      end

      it "can see no coffee roasts if there are none" do
        CoffeeRoast.destroy_all
        visit '/coffee_roasts'
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_content('No Coffee Roasts!')
      end
      it "I can only see fresh coffee roasts" do
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
                                  fresh: false)
        visit '/coffee_roasts'
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_link(roast1.name)
        expect(page).to_not have_link(roast2.name)
      end

      it "I see a link to edit roast information beside each coffee roast" do
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

        visit '/coffee_roasts'
        expect(page).to have_link(roast1.name)
        expect(page).to have_button("Update")
        expect(page).to have_link(roast2.name)
      end

      it "I see a link to delete each coffee roast" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        roast1 = company_1.coffee_roast.create!(name: 'Pinnacle',
                                  origin: 'test',
                                  elevation: 1000,
                                  fresh: true)

        visit '/coffee_roasts'
        expect(page).to have_link(roast1.name)
        expect(page).to have_button("Delete")

        click_on("Delete")
        expect(current_path).to eq('/coffee_roasts')
        expect(page).to_not have_link(roast1.name)
      end
    end
  end
end
