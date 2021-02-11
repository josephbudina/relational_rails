require 'rails_helper'

RSpec.describe 'The coffee company delete', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies/:id" do
      it "I can see a button to delete the coffee company" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        parlor = IceCreamParlor.create(name:"little man",
                                       street_number: 12,
                                       open: true)
        flavor = parlor.flavors.create!(name: 'Chocolate',
                                        flavor_rating: 3,
                                        in_stock: true)
        flavor_2 = parlor.flavors.create!(name: 'Ouachita',
                                          flavor_rating: 3,
                                          in_stock: true)


        visit "/coffee_companies/#{company_1.id}"
        click_button("Delete Coffee Company")

        expect(current_path).to eq ("/coffee_companies")

        expect(page).to_not have_content('Round Mountain Coffee')
      end
    end
  end
end