require 'rails_helper'

RSpec.describe CoffeeRoast, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :coffee_company_id}
    it {should validate_presence_of :origin}
    it {should validate_presence_of :elevation}

    it {should validate_uniqueness_of :name}
  end

  describe 'relationships' do
    it {should belong_to :coffee_company}
  end

  describe "class methods" do
    describe "::count" do
      it 'counts the number of coffee roasts' do
        CoffeeCompany.destroy_all
        CoffeeRoast.destroy_all
        comp1 = CoffeeCompany.create!(name: 'RMC',
          address: '123 Prince st',
          zipcode: 72034,
          created_at: 1.seconds.ago)
        roast1 = CoffeeRoast.create!(name: 'Pinnacle',
            coffee_company: comp1,
            origin: 'test',
            elevation: 1000,
            created_at: 1.seconds.ago)
        roast2 = CoffeeRoast.create!(name: 'Southern Weather',
              coffee_company: comp1,
              origin: 'test 2',
              elevation: 2000,
              created_at: 10.seconds.ago)

        expect(CoffeeRoast.count_of_roasts).to eq(2)
      end
    end

    describe "::fresh?" do
      it 'only shows records where the fresh column is `true`' do
        CoffeeCompany.destroy_all
        CoffeeRoast.destroy_all
        comp1 = CoffeeCompany.create!(name: 'RMC',
          address: '123 Prince st',
          zipcode: 72034,
          created_at: 1.seconds.ago)
        roast1 = CoffeeRoast.create!(name: 'Pinnacle',
            coffee_company: comp1,
            origin: 'test',
            elevation: 1000,
            fresh: true,
            created_at: 1.seconds.ago)
        roast2 = CoffeeRoast.create!(name: 'Southern Weather',
              coffee_company: comp1,
              origin: 'test 2',
              elevation: 2000,
              fresh: false,
              created_at: 10.seconds.ago)

        expect(CoffeeRoast.fresh?.to_a).to eq([roast1])
      end
    end
  end
end
