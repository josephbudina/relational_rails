class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode
  validates_uniqueness_of :name

  has_many :coffee_roast

  def self.order_by_created_date
    order('created_at desc')
  end

  def filter_by_elevation(elevation)
    coffee_roast.where("elevation > ?", elevation)
  end
end
