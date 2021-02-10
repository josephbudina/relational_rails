require 'rails_helper'

RSpec.describe 'Coffee company index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies" do
      it "I can see each coffee company" do
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
        expect(page).to have_content('Coffee Companies')
        expect(page).to have_link(company_1.name)
        expect(page).to have_link(company_2.name)
      end

      it "can see no coffee companies if there are none" do
        CoffeeCompany.destroy_all
        visit '/coffee_companies'
        expect(page).to have_content('Coffee Companies')
        expect(page).to have_content('No Coffee Companies!')
      end

      it "has a link for a new coffee company" do
        visit '/coffee_companies'
        expect(page).to have_link("New Coffee Company")
      end

      it "I see coffee companies ordered by most recently created first" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)
        visit '/coffee_companies'
        expect(company_2.name).to appear_before(company_1.name)
        expect(page).to have_content(company_1.created_at)
        expect(page).to have_content(company_2.created_at)
      end

      it "I see a link to edit company information beside each coffee company" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)
        visit '/coffee_companies'
        expect(page).to have_link(company_1.name)
        expect(page).to have_button("Update")
        expect(page).to have_link(company_2.name)
      end

      it "I see a link to delete each coffee company" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        visit '/coffee_companies'
        expect(page).to have_link(company_1.name)
        expect(page).to have_button("Delete")

        click_on("Delete")
        expect(current_path).to eq('/coffee_companies')
        expect(page).to_not have_link(company_1.name)
      end

      describe "I see a button to order by coffee roast count" do
        describe "When I click the button" do
          it "" do
            CoffeeRoast.destroy_all
            CoffeeCompany.destroy_all

            comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                          address: '2850 Prince St.',
                                          zipcode: 72034,
                                          local: true)

            comp1.coffee_roast.create!(name: 'Pinnacle',
                                      origin: 'test',
                                      elevation: 1000,
                                      fresh: true)
            comp1.coffee_roast.create!(name: 'Ouachita',
                                      origin: 'test 2',
                                      elevation: 2000,
                                      fresh: true)

            comp2 = CoffeeCompany.create!(name: 'Onyx Coffee Labs',
                                          address: '101 E Walnut St.',
                                          zipcode: 721414,
                                          local: false)

            comp2.coffee_roast.create!(name: 'Southern Weather',
                                      origin: 'Colombia/Ethiopia',
                                      elevation: 1850,
                                      fresh: true)
            comp2.coffee_roast.create!(name: 'Geometry',
                                      origin: 'Colombia/Ethiopia',
                                      elevation: 2100,
                                      fresh: true)
            comp2.coffee_roast.create!(name: 'Monarch',
                                      origin: 'Colombia/Ethiopia',
                                      elevation: 1800,
                                      fresh: false)
            visit '/coffee_companies'
            expect(page).to have_button("Sort By Number of Coffee Roasts")

            click_on("Sort By Number of Coffee Roasts")
            expect(current_path).to eq('/coffee_companies')
            expect(page).to have_content("Number of Roasts: 2")
            expect(comp2.name).to appear_before(comp1.name)
          end
        end
      end
    end
  end
end
