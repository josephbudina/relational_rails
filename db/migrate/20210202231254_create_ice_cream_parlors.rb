class CreateIceCreamParlors < ActiveRecord::Migration[5.2]
  def change
    create_table :ice_cream_parlors do |t|
      t.string :name
      t.boolean :open
      t.integer :employees

      t.timestamps
    end
  end
end
