require 'rails_helper'

RSpec.describe CoffeeCompany, type: :model do
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
        CoffeeCompany.destroy_all
        comp1 = CoffeeCompany.create!(name: 'RMC', address: '123 Prince st', zipcode: 72034, created_at: 1.seconds.ago)
        comp2 = CoffeeCompany.create!(name: 'Onyx',address: '123 W st', zipcode: 721414, created_at: 10.seconds.ago)

        expect(CoffeeCompany.order_by_created_date.to_a).to eq([comp1, comp2])
      end
    end
  end
end
