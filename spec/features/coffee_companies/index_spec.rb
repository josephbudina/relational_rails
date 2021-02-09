require 'rails_helper'

RSpec.describe 'Coffee company index page', type: :feature do
  describe "as a visitor" do
    describe "when I visit /coffee_companies" do
      it "I can see each coffee company" do
        CoffeeCompany.destroy_all
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)

        visit '/coffee_companies'
        expect(page).to have_content('Coffee Companies')
        expect(page).to have_link(company_1.name)
        expect(page).to have_link(company_2.name)
      end

      it "can see no coffee companies if there are none" do
        CoffeeCompany.destroy_all
        visit '/coffee_companies'
        expect(page).to have_content('Coffee Companies')
        expect(page).to have_content('No Coffee Companies!')
      end

      it "has a link for a new coffee company" do
        visit '/coffee_companies'
        expect(page).to have_link("New Coffee Company")
      end

      it "I see coffee companies ordered by most recently created first" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)
        visit '/coffee_companies'
        page.body.index(company_2.name).should < page.body.index(company_1.name)
        expect(page).to have_content(company_1.created_at)
        expect(page).to have_content(company_2.created_at)
      end

      it "I see a link to edit company information beside each coffee company" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)
        visit '/coffee_companies'
        expect(page).to have_link(company_1.name)
        expect(page).to have_link("Update")
        expect(page).to have_link(company_2.name)
      end

      it "I see a link to delete each coffee company" do
        company_1 = CoffeeCompany.create(name:"Round Mountain Coffee",
                                        address: "123 Prince St",
                                        zipcode: 72034,
                                        local: true)
        company_2 = CoffeeCompany.create(name:"Onyx Coffee Labs",
                                        address: "123 W St",
                                        zipcode: 72712,
                                        local: false)
        visit '/coffee_companies'
        expect(page).to have_link(company_1.name)
        expect(page).to have_button("Delete")
        expect(page).to have_link(company_2.name)
        click_on("Delete")
        expect(current_path).to eq('/coffee_companies')
        expect(page).to_not have_link(company_1.name)
      end
    end
  end
end
