class CreateCoffeeCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_companies do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.boolean :is_local

      t.timestamps
    end
  end
end
