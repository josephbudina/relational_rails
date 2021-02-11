require 'rails_helper'

RSpec.describe IceCreamParlor, type: :model do
  before :each do
    Flavor.destroy_all
    IceCreamParlor.destroy_all

    @parlor = IceCreamParlor.create!(name: 'little man',
                                    street_number: 23,
                                    created_at: 1.seconds.ago)
    @parlor2 = IceCreamParlor.create!(name: 'scoops',
                                  street_number: 23,
                                  created_at: 10.seconds.ago)
    @flavor1 = @parlor.flavors.create!(name: 'Southern Weather',
                                          flavor_rating: 4,
                                          created_at: 1.seconds.ago)
    @flavor2 = @parlor.flavors.create!(name: 'Pinnacle',
                                          flavor_rating: 3,
                                          created_at: 10.seconds.ago)
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :street_number}
  end

  describe 'relationships' do
    it {should have_many :flavors}
  end

  describe "instance methods" do
    describe "::order_alphabetically" do
      it 'orders roasts alphabetically by name' do
        expect(@parlor.order_alphabetically.to_a).to eq([@flavor2, @flavor1])
      end
    end
  end
end