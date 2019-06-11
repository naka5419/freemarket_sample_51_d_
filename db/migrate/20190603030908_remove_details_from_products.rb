class RemoveDetailsFromProducts < ActiveRecord::Migration[5.2]
    def change
      remove_column :products, :buyer
      remove_column :products, :seller
    end
end
