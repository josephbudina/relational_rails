require 'rails_helper'

RSpec.describe 'Flavor show page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /ice_cream_parlor/id" do
      it "I can see a Flavor and its attributes" do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
        parlor = IceCreamParlor.create!(name: 'Little Man',
                                        street_number: 12,
                                        open: true)

        flavor = parlor.flavors.create!(name: 'Vanilla',
                                        flavor_rating: 3,
                                        in_stock: true)

        visit "/flavors/#{flavor.id}"

        click_link("Update flavors")
        expect(current_path).to eq "/flavors/#{flavor.id}/edit"

        fill_in("flavor[name]", with: "TEST")

        click_on('Update Flavor')
        expect(page).to have_content('TEST')
      end
    end
  end
end