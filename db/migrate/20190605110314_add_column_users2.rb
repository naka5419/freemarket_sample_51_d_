class AddColumnUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postalcode, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city_name, :string
    add_column :users, :address_number, :string
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :user_image, :string
    add_column :users, :profile, :text
  end
end
