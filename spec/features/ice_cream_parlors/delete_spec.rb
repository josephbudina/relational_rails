require 'rails_helper'

RSpec.describe 'delete Flavor', type: :feature do
  describe "as a visitor" do
    describe "when I visit /ice_cream_parlors/:id" do
      it "I can see a button to delete flavor" do
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


        visit "/ice_cream_parlors/#{parlor.id}"
        click_button("Delete")

        expect(current_path).to eq ("/ice_cream_parlors")

        expect(page).to_not have_content('Ouachita')
      end
    end
  end
end