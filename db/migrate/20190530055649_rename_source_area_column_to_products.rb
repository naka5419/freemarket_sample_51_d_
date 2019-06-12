class RenameSourceAreaColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :shipping_cost, :integer
    change_column :products, :shipping_method, :integer
    change_column :products, :source_area, :integer
  end
end
