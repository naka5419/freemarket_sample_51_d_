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

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday|integer|null: false|
|postalcode|integer|null: false|
|address_pref|string|null: false|
|address_city|string|null: false|
|address_number|string|null: false|
|building_name|string|
|phone_number|integer|unique: true, null: false|
|user_image|string|
|profile|text|

### Association
- has_many :comments
- has_many :products
- has_many :trade_messages
- has_many :trades

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|shipping_cost|string|null: false|
|shipping_method|string|null: false|
|source_area|string|null: false|
|shipping_days|string|null: false|
|price|integer|null: false|

### Association
- has_many :comments
- has_many :categorys
- belongs_to :user
- has_many :trade_messages

## product_statusテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|status|integer|null: false|

### Association

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|image|string|null: false|

### Association

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category|string|null: false|

### Association
- belongs_to :product

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|foreign_key: true|
|seller_id|intefer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user

## trade_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foerign_key: true|
|message|text|null: false|
|product_id|integer|foerign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## merpaysテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|profit|integer|
|point|integer|

### Association

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|buyer_id|integer|foreign_key: true|
|seller_id|intefer|foreign_key: true|
|product_id|integer|foerign_key: true|
|review|text|

### Association

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foerign_key: true|
|size|string|null: false|

### Association

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foerign_key: true|
|bland|string|null: false|

### Association
