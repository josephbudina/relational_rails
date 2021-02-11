require 'rails_helper'
  RSpec.describe 'As a vistor' do
    describe 'When I visit ice_cream_parlor index page' do
      it 'sees a link to create a new parlor' do
        Flavor.destroy_all
        IceCreamParlor.destroy_all
      little_man = IceCreamParlor.create!(name: 'little man', open: 'true', street_number: '42')
      scoops = IceCreamParlor.create!(name: 'scoops', open: 'true', street_number: '42')

      visit "/ice_cream_parlors"

      expect(page).to have_link("New Ice Cream Parlor")
    end

    describe 'When I click this link' do
      Flavor.destroy_all
      IceCreamParlor.destroy_all
      it 'takes me to /ice_cream_parlors/new where there is a form to make new parlor' do
        visit "/ice_cream_parlors"
        click_link 'New Ice Cream Parlor'
        expect(current_path).to eq "/ice_cream_parlors/new"

        fill_in('ice_cream_parlor[name]', with: 'little man')
        fill_in('ice_cream_parlor[street_number]', with: '43')
        fill_in('ice_cream_parlor[open]', with: true)
        click_on('submit')
        expect(page).to have_content('little man')
      end
    end
  end
end
