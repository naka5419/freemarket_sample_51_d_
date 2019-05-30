class Product < ApplicationRecord
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :trade_messages
  has_many :likes
  belongs_to :bland
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :size
  has_many :evaluations
  has_many_attached :images

  enum shipping_cost: { "送料込み（出品者負担）": "0", "着払い（購入者負担）": "1" }
end
