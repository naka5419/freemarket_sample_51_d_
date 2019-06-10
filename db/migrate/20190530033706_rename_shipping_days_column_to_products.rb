class RenameShippingDaysColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :shipping_days, :shipping_day
  end
end
