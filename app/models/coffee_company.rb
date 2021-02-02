class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode,
                        :is_local

  #has_many :coffee_roasts
end
