class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode,
                        :local

  has_many :coffee_roast
end
