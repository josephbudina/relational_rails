class CreateCoffeeRoasts < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_roasts do |t|
      t.references :coffee_company, index:true, foreign_key: true
      t.string :name
      t.string :origin
      t.integer :elevation
      t.boolean :is_fresh

      t.timestamps
    end
  end
end
