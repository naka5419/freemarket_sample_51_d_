# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday|integer|null: false|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city_name|string|null: false|
|address_number|string|null: false|
|building_name|string|
|phone_number|integer|unique: true, null: false|
|user_image|string|
|profile|text|

### Association
- has_many :comments
- has_many :products
- has_many :trade_messages
- has_many :evaluations
- has_many :likes
- has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
- has_many :selling_products, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Product"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Product"
- has_many :credentials

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|brand_id|integer|foreign_key: true, index: true|
|condition|integer|null: false, default: 0, limit: 1|
|shipping_cost|string|null: false|
|shipping_method|string|null: false|
|source_area|string|null: false|
|shipping_days|string|null: false|
|price|integer|null: false|
|status|integer|null: false, default: 0, limit: 1|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true|

### Association
- has_many :comments
- has_many :product_categories
- has_many :categories, through: :product-categories
- has_many :trade_messages
- has_many :likes
- belongs_to :bland
- belongs_to :buyer, class_name: "User"
- belongs_to :seller, class_name: "User"
- belongs_to :size
- has_many :evaluations
- has_many_attached :images

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false, index: true|
|parent_id|integer|

### Association
- has_many :product_categories
- has_many :products, through: :product_categories
- belongs_to :parent, class_name: :Category, foreign_key: :parent_id
- has_many :children, class_name: :Category, foreign_key: :parent_id


## product_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## trade_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foerign_key: true|
|message|text|null: false|
|product_id|integer|foerign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true|
|product_id|integer|foerign_key: true|
|review|text|

### Association
- belongs_to :buyer_id, class_name: "Product"
- belongs_to :seller_id, class_name: "Product"
- belongs_to :product

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foerign_key: true|
|size|string|null: false|

### Association
- has_many :products

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|
|provider|string|

### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
