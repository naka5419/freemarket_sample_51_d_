class Product < ApplicationRecord
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product-categories
  has_many :trade_messages
  has_many :likes
  belongs_to :bland
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :size
  has_many :evaluations
end
