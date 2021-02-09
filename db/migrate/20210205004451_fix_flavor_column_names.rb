class FixFlavorColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :flavors, :frozen, :in_stock
    rename_column :flavors, :inventory, :flavor_rating
  end
end
