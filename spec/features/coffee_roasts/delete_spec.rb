require 'rails_helper'

RSpec.describe 'The coffee roast delete', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_roasts/:id" do
      it "I can see a button to delete the coffee roast" do
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

        visit "/coffee_roasts/#{roast1.id}"
        click_button("Delete Coffee Roast")

        expect(current_path).to eq ("/coffee_roasts")

        expect(page).to_not have_content('Pinnacle')
      end
    end
  end
end
