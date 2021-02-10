class Flavor < ApplicationRecord
  validates_presence_of   :name,
                          :flavor_rating
  validates_uniqueness_of :name
  belongs_to  :ice_cream_parlor, class_name: "IceCreamParlor"

  def self.flavor_count
    count
  end

  def self.flavor_rating_above(threshold)
    where("flavor_rating > #{threshold}")
  end

  def order_alphabetically
    order(:name)
  end
end