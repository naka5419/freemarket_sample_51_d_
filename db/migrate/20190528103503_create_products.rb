class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :condition, null: false, default: 0, limit: 1
      t.string :shipping_cost, null: false
      t.string :shipping_method, null: false
      t.string :source_area, null: false
      t.string :shipping_days, null: false
      t.integer :price, null: false
      t.integer :status, null: false, default: 0, limit: 1
      t.timestamps
    end
  end
end
