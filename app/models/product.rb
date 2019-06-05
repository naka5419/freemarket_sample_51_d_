class Product < ApplicationRecord
  has_many :comments
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :trade_messages
  has_many :likes
  belongs_to :bland, optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :size, optional: true
  has_many :evaluations
  has_many_attached :images
  enum condition: { 新品、未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum shipping_cost: { "送料込み(出品者負担)": "0", "着払い(購入者負担)": "1" }
end
