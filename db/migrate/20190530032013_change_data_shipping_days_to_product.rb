class ChangeDataShippingDaysToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :shipping_days, :integer
  end
end
