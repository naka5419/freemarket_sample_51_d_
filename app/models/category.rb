class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  belongs_to :parent, class_name: :Category, foreign_key: :parent_id
  has_many :children, class_name: :Category, foreign_key: :parent_id
end
