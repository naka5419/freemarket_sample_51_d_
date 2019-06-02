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

  enum condition: { 新品、未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
end
