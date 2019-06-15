crumb :root do
  link 'メルカリ', root_path
end

crumb :index_card do
  link '支払い方法', "/cards"
  parent :index_profile
end

crumb :new_card do
  link "クレジットカード情報入力"
  parent :index_card
end

crumb :show_card do
  link "支払い方法"
  parent :index_profile
end

crumb :show_product do |product|
  link "#{product.name}"
  parent :root
end

crumb :index_profile do
  link "マイページ", "/users/#{current_user.id}/profiles"
  parent :root
end

crumb :edit_profile do
  link "プロフィール"
  parent :index_profile
end