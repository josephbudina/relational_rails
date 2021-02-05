class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode
  validates_uniqueness_of :name

  has_many :coffee_roast

end
