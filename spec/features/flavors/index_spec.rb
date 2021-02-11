require 'rails_helper'

RSpec.describe 'Flavor index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /flavors" do
      it "I can see each flavor" do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
        parlor = IceCreamParlor.create!(name: 'Little Man',
                                        street_number: 12,
                                        open: true)

        flavor = parlor.flavors.create!(name: 'Vanilla',
                                        flavor_rating: 3,
                                        in_stock: true)
        flavor_2 = parlor.flavors.create!(name: 'Ouachita',
                                          flavor_rating: 3,
                                          in_stock: true)

        visit '/flavors'
        expect(page).to have_content('Flavors')
        expect(page).to have_link(flavor.name)
        expect(page).to have_link(flavor_2.name)
      end

      it "can see no Flavors if there are none" do
        Flavor.destroy_all
        visit '/flavors'
        expect(page).to have_content('Flavors')
        expect(page).to have_content('No flavors!')
      end
      it "I can only see fresh Flavors" do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
        parlor = IceCreamParlor.create!(name: 'Little Man',
                                        street_number: 12,
                                        open: true)

        flavor = parlor.flavors.create!(name: 'Vanilla',
                                        flavor_rating: 3,
                                        in_stock: true)

        flavor_2 = parlor.flavors.create!(name: 'Chocolate',
                                        flavor_rating: 3,
                                        in_stock:false)
        visit '/flavors'
        expect(page).to have_content('Flavors')
        expect(page).to have_link(flavor.name)
        expect(page).to_not have_link(flavor_2.name)
      end

      it "I see a link to edit flavor information beside each flavor" do
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
        expect(page).to have_link(flavor.name)
        expect(page).to have_link("Edit")
        expect(page).to have_link(flavor_2.name)
      end

      it "I see a link to delete each coffee roast" do
        parlor = IceCreamParlor.create(name:"scoops",
                                        street_number: 45,
                                        open: true)
        flavor = parlor.flavors.create!(name: 'Vanilla',
                                        flavor_rating: 3,
                                        in_stock: true)

        visit '/flavors'
        expect(page).to have_link(flavor.name)
        expect(page).to have_button("delete")

        click_on("delete")
        expect(current_path).to eq('/flavors')
        expect(page).to_not have_link(flavor.name)
      end
    end
  end
end