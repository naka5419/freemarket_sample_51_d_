class ChangeDatatypeCondition < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :condition, :integer, null: false
  end
end
