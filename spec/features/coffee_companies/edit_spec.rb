require 'rails_helper'

RSpec.describe 'The coffee company update page', type: :feature do
  describe "As a visitor" do
    describe "When I visit the coffee company show page" do
      describe "I see a link to 'Update Coffee Company'" do
        describe "When I click this link" do
          it "I am taken to a new coffee_companies/:id/edit where I can edit the company's attributes" do
            CoffeeCompany.destroy_all
            company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                            address: "123 Prince St",
                                            zipcode: 72034,
                                            local: true)
            visit "/coffee_companies/#{company_1.id}"

            click_link("Update Coffee Company")
            expect(current_path).to eq "/coffee_companies/#{company_1.id}/edit"

            fill_in('Name', with: 'Round Mountain')

            click_on('Update Coffee Company')
            expect(page).to have_content('Round Mountain')
          end
        end
      end
    end
  end
end
