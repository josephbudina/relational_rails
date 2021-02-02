class CreateFlavors < ActiveRecord::Migration[5.2]
  def change
    create_table :flavors do |t|
      t.string :name
      t.boolean :frozen
      t.integer :inventory
      t.references :ice_cream_parlor, foreign_key: true

      t.timestamps
    end
  end
end
