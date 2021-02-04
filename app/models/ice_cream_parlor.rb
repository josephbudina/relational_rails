class IceCreamParlor < ApplicationRecord
  validates_presence_of   :name,
                          :open,
                          :street_number
  validates_uniqueness_of :name
  has_many  :flavors
end