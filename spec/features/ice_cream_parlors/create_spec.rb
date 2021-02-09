require 'rails_helper'
  RSpec.describe 'As a vistor' do
    describe 'When I visit ice_cream_parlor index page' do
      it 'sees a link to create a new parlor' do
      little_man = IceCreamParlor.create!(name: 'little man', open: 'true', street_number: '42')
      scoops = IceCreamParlor.create!(name: 'scoops', open: 'true', street_number: '42')

      visit "/ice_cream_parlor"

      expect(page).to have_link("New Ice Cream Parlor")
    end

    describe 'When I click this link' do
      it 'takes me to /ice_cream_parlor/new where there is a form to make new parlor' do
        visit "/ice_cream_parlor"
        click_link 'New Ice Cream Parlor'

        #expect(page)to. have_content
      end
    end
  end
end
