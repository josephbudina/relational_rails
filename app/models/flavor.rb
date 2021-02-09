class Flavor < ApplicationRecord
  validates_presence_of   :name,
                          :flavor_rating
  validates_uniqueness_of :name
  belongs_to  :ice_cream_parlor, class_name: "IceCreamParlor"
end