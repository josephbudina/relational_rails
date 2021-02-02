require 'rails_helper'

 RSpec.describe CoffeeRoast, type: :model do
   describe 'validations' do
     it {should validate_presence_of :name}
     it {should validate_presence_of :coffee_company_id}
     it {should validate_presence_of :origin}
     it {should validate_presence_of :elevation}
     it {should validate_presence_of :fresh}
   end

   describe 'relationships' do
     it {should belong_to :coffee_company}
   end
 end
