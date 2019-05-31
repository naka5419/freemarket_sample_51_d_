class ChangeDatatypeCreatedAt < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :created_at, :datetime, null: true
    change_column :products, :updated_at, :datetime, null: true
  end
end
