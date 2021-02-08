require 'rails_helper'

RSpec.describe 'The coffee company creation page', type: :feature do
  describe "As a visitor" do
    describe "When I visit the coffee company index page" do
      describe "I see a link to create a new coffee company" do
        describe "When I click this link" do
          it "I am taken to a new coffee_companies/new where I can add a new company" do
            visit '/coffee_companies'

            click_link("New Coffee Company")
            expect(current_path).to eq "/coffee_companies/new"

            fill_in('Name', with: 'Round Mountain')
            fill_in('Address', with: '123 Prince St')
            fill_in('Zipcode', with: 72034)

            click_on('Create Coffee Company')
            expect(page).to have_content('Round Mountain')
          end
        end
      end
    end
  end
end
