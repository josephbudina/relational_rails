require 'rails_helper'

RSpec.describe 'Flavor show page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /flavors/id" do
      it "I can see a flavor and its attributes" do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
        parlor = IceCreamParlor.create(name:"little man",
                                      street_number: 12,
                                      open: true)
        flavor = parlor.flavors.create!(name: 'Chocolate',
                                        flavor_rating: 3,
                                        in_stock: true)
        flavor_2 = parlor.flavors.create!(name: 'Ouachita',
                                          flavor_rating: 3,
                                          in_stock: true)

        visit '/flavors'
        click_link("Chocolate")

        expect(current_path).to eq ("/flavors/#{flavor.id}")

        expect(page).to have_content('Chocolate')
        expect(page).to have_content("3")
        expect(page).to_not have_content(flavor_2.name)
        expect(page).to have_content("In Stock?")
      end
    end
  end
end
