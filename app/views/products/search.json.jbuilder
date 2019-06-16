json.array! @categories do |category|
  json.id   category.id
  json.name category.name
end

json.array! @childCategories do |childCategory|
  json.id   childCategory.id
  json.name childCategory.name
end
