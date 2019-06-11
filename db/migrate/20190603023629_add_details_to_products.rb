class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :buyer, :integer
    add_column :products, :seller, :integer
  end
end
