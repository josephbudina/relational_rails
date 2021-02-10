class CoffeeCompany < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :zipcode
  validates_uniqueness_of :name

  has_many :coffee_roast

  def self.order_by_created_date
    order(created_at: :desc)
  end

  def self.order_by_roast_count
    left_joins(:coffee_roast)
    .group(:id)
    .where
    .not(coffee_roast:[nil])
    .order("count(coffee_roasts.id) desc")
  end

  def filter_by_elevation(elevation)
    coffee_roast.where("elevation > ?", elevation)
  end

  def order_alphabetically
    coffee_roast.order(:name)
  end
end
