require 'rails_helper'

RSpec.describe 'Coffee roast index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_roasts" do
      it "I can see each coffee roast" do
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
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_link(roast1.name)
        expect(page).to have_link(roast2.name)
      end

      it "can see no coffee roasts if there are none" do
        CoffeeRoast.destroy_all
        visit '/coffee_roasts'
        expect(page).to have_content('Coffee Roasts')
        expect(page).to have_content('No Coffee Roasts!')
      end
    end
  end
end
