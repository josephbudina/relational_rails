class FixColumnName2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :ice_cream_parlors, :employees, :street_number
  end
end
