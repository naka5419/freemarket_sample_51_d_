crumb :root do
  link 'メルカリ', root_path
end

crumb :index_card do
  link '支払い方法', "/cards"
  parent :index_user
end

crumb :new_card do
  link "クレジットカード情報入力", new_card_path
  parent :index_card
end

crumb :show_card do
  link "支払い方法", cards_path
  parent :index_user
end

crumb :show_product do |product|
  link product.name, product_path
  parent :root
end

crumb :index_user do |user|
  link "マイページ",
  parent :root
end