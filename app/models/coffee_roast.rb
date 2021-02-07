class CoffeeRoast < ApplicationRecord
  validates_presence_of :name,
                        :coffee_company_id,
                        :origin,
                        :elevation

    validates_uniqueness_of :name
    belongs_to :coffee_company, class_name: "CoffeeCompany"

  def self.count_of_roasts
    count
  end

  def self.fresh?
    CoffeeRoast.where(fresh: true)
  end
end
