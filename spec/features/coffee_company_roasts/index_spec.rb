require 'rails_helper'

RSpec.describe 'Coffee Company Roast index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies/:id/coffee_roasts" do
      it "I can see each coffee roast associated with that coffee company" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                      address: '2850 Prince St.',
                                      zipcode: 72034,
                                      local: true)

        roast1 = comp1.coffee_roast.create!(name: 'Pinnacle',
                                  origin: 'test',
                                  elevation: 1000,
                                  fresh: true)
        roast2 = comp1.coffee_roast.create!(name: 'Ouachita',
                                  origin: 'test 2',
                                  elevation: 2000,
                                  fresh: true)

        visit "/coffee_companies/#{comp1.id}/coffee_roasts"
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_link(roast1.name)
        expect(page).to have_link(roast2.name)
      end

      it "can see no coffee roasts if there are none" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                      address: '2850 Prince St.',
                                      zipcode: 72034,
                                      local: true)
        visit "/coffee_companies/#{comp1.id}/coffee_roasts"
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_content('No Coffee Roasts!')
      end

      describe "I see a form that allows my to input an elevation number" do
        it "only returns coffee roasts with elevation higher than that number" do
          CoffeeRoast.destroy_all
          CoffeeCompany.destroy_all
          comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                        address: '2850 Prince St.',
                                        zipcode: 72034,
                                        local: true)

          roast1 = comp1.coffee_roast.create!(name: 'Pinnacle',
                                    origin: 'test',
                                    elevation: 1000,
                                    fresh: true)
          roast2 = comp1.coffee_roast.create!(name: 'Ouachita',
                                    origin: 'test 2',
                                    elevation: 2000,
                                    fresh: true)

          visit "/coffee_companies/#{comp1.id}/coffee_roasts"

          fill_in('elevation_number', with: 1500)
          click_on("Only Return Records With Elevation Higher Than Number")
          expect(page).to have_content('Coffee Roasts')
          expect(page).to_not have_link(roast1.name)
          expect(page).to have_link(roast2.name)
        end
      end

      describe "I see a linked to sort roasts in alphabetical order" do
        describe "when I click link" do
          it "I see coffee roasts in alphabetical order" do
            CoffeeRoast.destroy_all
            CoffeeCompany.destroy_all
            comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                          address: '2850 Prince St.',
                                          zipcode: 72034,
                                          local: true)

            roast1 = comp1.coffee_roast.create!(name: 'Pinnacle',
                                      origin: 'test',
                                      elevation: 1000,
                                      fresh: true)
            roast2 = comp1.coffee_roast.create!(name: 'Ouachita',
                                      origin: 'test 2',
                                      elevation: 2000,
                                      fresh: true)

            visit "/coffee_companies/#{comp1.id}/coffee_roasts"

            click_on("Sort Alphabetically")
            expect(page).to have_content('Coffee Roasts')
            expect(page).to have_link(roast1.name)
            expect(page).to have_link(roast2.name)
          end
        end
      end
    end
  end
end
