class IceCreamParlor < ApplicationRecord
  validates_presence_of   :id,
                          :name,
                          :open,
                          :employees
  validates_uniqueness_of :id,
                          :name
  has_many  :flavors
end