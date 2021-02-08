require 'rails_helper'

RSpec.describe 'Coffee roast show page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_roasts/id" do
      it "I can see a coffee roast and its attributes" do
        CoffeeRoast.destroy_all
        CoffeeCompany.destroy_all
        comp1 = CoffeeCompany.create!(name: 'Round Mountain Coffee',
                                      address: '2850 Prince St.',
                                      zipcode: 72034,
                                      local: true)

        roast1 = comp1.coffee_roast.create!(name: 'Pinnacle',
                                  origin: 'test',
                                  elevation: 1000,
                                  fresh: true)
        roast2 = comp1.coffee_roast.create!(name: 'Ouachita',
                                  origin: 'test 2',
                                  elevation: 2000,
                                  fresh: true)

        visit '/coffee_roasts'
        click_link("Pinnacle")

        expect(current_path).to eq ("/coffee_roasts/#{roast1.id}")

        expect(page).to have_content('Pinnacle')
        expect(page).to have_content("Origin: #{roast1.origin}")
        expect(page).to have_content("Elevation: #{roast1.elevation}")
        expect(page).to_not have_content(roast2.name)
        expect(page).to have_content("Fresh?")
      end
    end
  end
end
