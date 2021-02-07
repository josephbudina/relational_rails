require 'rails_helper'

RSpec.describe CoffeeCompany, type: :model do
  before :each do
    CoffeeRoast.destroy_all
    CoffeeCompany.destroy_all

    @comp1 = CoffeeCompany.create!(name: 'RMC',
                                  address: '123 Prince st',
                                  zipcode: 72034,
                                  created_at: 1.seconds.ago)
    @comp2 = CoffeeCompany.create!(name: 'Onyx',
                                  address: '123 W st',
                                  zipcode: 721414,
                                  created_at: 10.seconds.ago)
    @roast1 = @comp1.coffee_roast.create!(name: 'Southern Weather',
                                origin: 'test',
                                elevation: 1000,
                                created_at: 1.seconds.ago)
    @roast2 = @comp1.coffee_roast.create!(name: 'Pinnacle',
                                origin: 'test 2',
                                elevation: 2000,
                                created_at: 10.seconds.ago)
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :zipcode}

    it {should validate_uniqueness_of :name}
  end

  describe 'relationships' do
    it {should have_many :coffee_roast}
  end

  describe "class methods" do
    describe "::order_by_created_date" do
      it 'orders companies correctly by created date' do
        expect(CoffeeCompany.order_by_created_date.to_a).to eq([@comp1, @comp2])
      end
    end
  end

  describe "instance methods" do
    describe "::filter_by_elevation" do
      it 'filters roasts that are greater than elevation input' do
        expect(@comp1.filter_by_elevation(1500)).to eq([@roast2])
      end
    end

    describe "::order_alphabetically" do
      it 'orders roasts alphabetically by name' do
        expect(@comp1.order_alphabetically.to_a).to eq([@roast2, @roast1])
      end
    end
  end
end
