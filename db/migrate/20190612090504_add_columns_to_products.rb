class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    # remove_reference :products, :bland, foreign_key: true
    add_reference :products, :category, foreign_key: true
    add_column :products, :bland, :string
    add_column :products, :size, :integer
  end
end
