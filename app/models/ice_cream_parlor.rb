class IceCreamParlor < ApplicationRecord
  validates_presence_of   :name,
                          :open,
                          :street_number
  validates_uniqueness_of :name
  has_many  :flavors

  def self.order_by_created_date
    order('created_at desc')
  end

  def order_alphabetically
    flavors.order(:name)
  end
end