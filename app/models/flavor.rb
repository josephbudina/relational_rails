class Flavor < ApplicationRecord
  validates_presence_of   :flavor_name,
                          :in_stock,
                          :flavor_rating
  validates_uniqueness_of :name
  belongs_to  :ice_cream_parlor, class_name: "IceCreamParlor"
end