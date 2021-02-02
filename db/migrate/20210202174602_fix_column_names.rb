class FixColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :coffee_companies, :is_local, :local
    rename_column :coffee_roasts, :is_fresh, :fresh
  end
end
