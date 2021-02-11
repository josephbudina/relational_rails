require 'rails_helper'

RSpec.describe 'The flavor update page', type: :feature do
  describe "As a visitor" do
    describe "When I visit the flavor show page" do
      describe "I see a link to 'Update Ice Cream Parlor'" do
        describe "When I click this link" do
          it "I am taken to a new ice_cream_parlors/:id/edit where I can edit the parlor's attributes" do
            IceCreamParlor.destroy_all
            parlor = IceCreamParlor.create(name:"little man",
                                          street_number: 12,
                                          open: true)
            visit "/ice_cream_parlors/#{parlor.id}"

            click_link("Update Parlors")
            expect(current_path).to eq "/ice_cream_parlors/#{parlor.id}/edit"

            fill_in('ice_cream_parlor[name]', with: 'little man')

            click_button('submit')
            expect(page).to have_content('little man')
          end
        end
      end
    end
  end
end