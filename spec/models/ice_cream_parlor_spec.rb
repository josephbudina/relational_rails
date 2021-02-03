require 'rails_helper'

RSpec.describe IceCreamParlor, type: :model do
  describe 'validations' do
    it {should validate_uniqueness_of :name}
    it {should validate_presence_of :name}
    it {should validate_presence_of :open}
    it {should validate_presence_of :employees}
  end

  describe 'relationships' do
    it {should have_many :flavors}
  end
end