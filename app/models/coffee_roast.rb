class CoffeeRoast < ApplicationRecord
  validates_presence_of :name,
                        :coffee_company_id,
                        :origin,
                        :elevation,
                        :is_fresh

    belongs_to :coffee_company
end
