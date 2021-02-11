require 'rails_helper'

RSpec.describe Flavor, type: :model do
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
    it {should validate_presence_of :flavor_rating}
  end

  describe 'relationships' do
    it {should belong_to :ice_cream_parlor}
  end

  describe "class methods" do
    describe "::flavor_rating_above" do
      it "finds higher ratings" do
        expect(Flavor.flavor_rating_above(3)).to eq([@flavor1])
      end
    end
  end
end