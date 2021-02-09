require 'rails_helper'
 RSpec.describe 'As a visitor' do
  describe 'When I visit /ice_cream_parlor' do
    it 'I see the name of each ice cream parlor' do
    little_man = IceCreamParlor.create!(name: 'little man', open: 'true', street_number: '42')
    scoops = IceCreamParlor.create!(name: 'scoops', open: 'true', street_number: '42')

    visit "/ice_cream_parlor"

    expect(page).to have_content("Parlors")
    expect(page).to have_link("little man")
    expect(page).to have_link("scoops")
    end
  end
end