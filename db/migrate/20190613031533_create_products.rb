class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :name, null: false
      t.text     :description, null: false
      t.integer  :condition, null: false
      t.integer  :shipping_cost, null: false
      t.integer  :shipping_method, null: false
      t.integer  :source_area, null: false
      t.integer  :shipping_day, null: false
      t.integer  :price, null: false
      t.integer  :status, null: false, default: 0
      t.integer  :buyer_id
      t.integer  :seller_id
      t.string   :bland
      t.integer  :size
      t.integer  :category_id
      t.timestamps
    end
  end
end
