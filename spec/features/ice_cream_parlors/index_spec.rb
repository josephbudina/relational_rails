require 'rails_helper'
 RSpec.describe 'As a visitor' do
  describe 'When I visit /ice_cream_parlors' do
    it 'I see the name of each ice cream parlor' do
      little_man = IceCreamParlor.create!(name: 'little man', open: 'true', street_number: '42')
      scoops = IceCreamParlor.create!(name: 'scoops', open: 'true', street_number: '42')

      visit "/ice_cream_parlors"

      expect(page).to have_content("Parlors")
      expect(page).to have_link("little man")
      expect(page).to have_link("scoops")
    end
    it "can see no Ice Cream Parlors if there are none" do
      IceCreamParlor.destroy_all
      visit '/ice_cream_parlors'
      expect(page).to have_content('Parlors')
      expect(page).to have_content('New Ice Cream Parlor')
    end

    it "has a link for a new Ice Cream Parlor" do
      visit '/ice_cream_parlors'
      expect(page).to have_link("New Ice Cream Parlor")
    end

    it "I see Ice Cream Parlors ordered by most recently created first" do
      parlor = IceCreamParlor.create(name:"scoops",
                                    street_number: 12,
                                    open: true)
      parlor2 = IceCreamParlor.create(name:"little man",
                                      street_number: 12,
                                      open: true)
      visit '/ice_cream_parlors'
      expect(parlor2.name).to appear_before(parlor.name)
      expect(page).to have_content(parlor.created_at)
      expect(page).to have_content(parlor2.created_at)
    end

    it "I see a link to edit company information beside each coffee company" do
      parlor = IceCreamParlor.create(name:"little man",
                                    street_number: 12,
                                    open: true)
      parlor2 = IceCreamParlor.create(name:"scoops",
                                      street_number: 45,
                                      open: true)
      visit '/ice_cream_parlors'
      expect(page).to have_link(parlor.name)
      expect(page).to have_link("Edit")
      expect(page).to have_link(parlor2.name)
    end

    it "I see a link to delete each parlor" do
      Flavor.destroy_all
      IceCreamParlor.destroy_all
      parlor = IceCreamParlor.create(name:"little man",
                                    street_number: 12,
                                    open: true)
      visit '/ice_cream_parlors'
      expect(page).to have_link(parlor.name)
      expect(page).to have_button("Delete")

      click_on("Delete")
      expect(current_path).to eq('/ice_cream_parlors')
      expect(page).to_not have_link(parlor.name)
    end
  end
end