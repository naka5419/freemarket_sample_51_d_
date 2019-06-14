class AddColumnBuyer < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :buyer_id, :integer, default: 0
  end
end
