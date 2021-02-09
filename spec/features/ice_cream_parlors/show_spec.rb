require 'rails_helper'
RSpec.describe 'As a visitor' do
  describe 'When I visit ice_cream_parlor/:id' do
    it 'sees parlor with that id and attributes' do
      little_man = IceCreamParlor.create!(name: 'little man', open: 'true', street_number: '42')
      scoops = IceCreamParlor.create!(name: 'scoops', open: 'true', street_number: '42')

      visit "/ice_cream_parlor"
      click_link 'little man'
      expect(current_path).to eq("/ice_cream_parlor/#{little_man.id}")
      expect(page).to have_content("#{little_man.name}")
      expect(page).to have_content("#{little_man.street_number}")
      visit "/ice_cream_parlor"
      click_link 'scoops'
      expect(current_path).to eq("/ice_cream_parlor/#{scoops.id}")
      expect(page).to have_content("#{scoops.name}")
      expect(page).to have_content("#{scoops.street_number}")
    end
  end
end