class CoffeeRoast < ApplicationRecord
  validates_presence_of :name,
                        :coffee_company_id,
                        :origin,
                        :elevation

    belongs_to :coffee_company, class_name: "CoffeeCompany"
end
