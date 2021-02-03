require 'rails_helper'

 RSpec.describe CoffeeCompany, type: :model do
   describe 'validations' do
     it {should validate_presence_of :name}
     it {should validate_presence_of :address}
     it {should validate_presence_of :zipcode}
     it {should validate_presence_of :local}

     it {should validate_uniqueness_of :name}
   end

   describe 'relationships' do
     it {should have_many :coffee_roast}
   end
 end
