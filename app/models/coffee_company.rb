class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode,
                        :local
  validates_uniqueness_of :name

  has_many :coffee_roast

end
