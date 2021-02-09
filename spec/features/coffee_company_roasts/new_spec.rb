require 'rails_helper'

RSpec.describe 'Coffee Company Roast create page', type: :feature do
  describe "As a visitor" do
    describe "When I visit the coffee company roast index page" do
      describe "I see a link to create a new coffee roast" do
        describe "When I click this link" do
          it "I am taken to a new coffee_companies/:company_id/coffee_roasts/new where I can add a new roast" do
            CoffeeCompany.destroy_all
            company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                            address: "123 Prince St",
                                            zipcode: 72034,
                                            local: true)
            visit "/coffee_companies/#{company_1.id}/coffee_roasts"

            click_link("New Coffee Roast")
            expect(current_path).to eq "/coffee_companies/#{company_1.id}/coffee_roasts/new"

            fill_in('Name', with: 'Pinnacle')
            fill_in('Origin', with: 'Colombia')
            fill_in('Elevation', with: 1500)

            click_on('Create Coffee Roast')
            expect(page).to have_content('Pinnacle')
          end
        end
      end
    end
  end
end
