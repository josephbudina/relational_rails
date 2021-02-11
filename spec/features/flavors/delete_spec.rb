require 'rails_helper'

RSpec.describe 'delete Flavor', type: :feature do
  describe "as a visitor" do
    describe "when I visit /flavors/:id" do
      it "deletes flavor" do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
        parlor = IceCreamParlor.create!(name: 'Little Man',
                                        street_number: 12,
                                        open: true)

        flavor = parlor.flavors.create!(name: 'Vanilla',
                                      flavor_rating: 3,
                                      in_stock: true)

        visit "/flavors/#{flavor.id}"
        click_button("Delete")

        expect(current_path).to eq ("/flavors")

        expect(page).to_not have_content('Little Man')
      end
    end
  end
end
