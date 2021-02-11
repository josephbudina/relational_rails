require 'rails_helper'

RSpec.describe 'Ice Cream Parlor Flavors create page', type: :feature do
  describe "As a visitor" do
    describe "When I visit the Ice Cream Parlor Flavor index page" do
      describe "I see a link to create a new flavor" do
        describe "When I click this link" do
          it "I am taken to a new ice_cream_parlors/:parlor_id/flavors/new where I can add a new flavor" do
            IceCreamParlor.destroy_all
            parlor = IceCreamParlor.create(name:"scoops",
                                          street_number: 45,
                                          open: true)
            visit "/ice_cream_parlors/#{parlor.id}/flavors"

            click_link("New Flavor")
            expect(current_path).to eq "/ice_cream_parlors/#{parlor.id}/flavors/new"

            fill_in('Name', with: 'Vanilla')
            fill_in('Flavor rating', with: 4)
            click_on('Create New Flavor')
            expect(page).to have_content('Vanilla')
          end
        end
      end
    end
  end
end