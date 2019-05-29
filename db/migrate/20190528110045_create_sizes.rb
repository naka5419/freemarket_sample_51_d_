class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.references :product, foreign_key: true
      t.string :size, null: false
      t.timestamps
    end
  end
end
