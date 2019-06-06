class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :firstname_kana, :string
    add_column :users, :lastname_kana, :string
    add_column :users, :birthday, :integer
  end
end
