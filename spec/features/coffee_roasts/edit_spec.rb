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

        visit "/coffee_roasts/#{roast1.id}"

        click_link("Update Coffee Roast")
        expect(current_path).to eq "/coffee_roasts/#{roast1.id}/edit"

        fill_in('Name', with: 'TEST')

        click_on('Update Coffee Roast')
        expect(page).to have_content('TEST')
      end
    end
  end
end
