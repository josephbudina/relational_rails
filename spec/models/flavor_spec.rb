require 'rails_helper'

RSpec.describe Flavor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :in_stock}
    it {should validate_presence_of :flavor_rating}
  end

  describe 'relationships' do
    it {should belong_to :ice_cream_parlor}
  end
end