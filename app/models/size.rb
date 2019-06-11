class Size < ApplicationRecord
  # has_many :products

  enum size: { "XXS以下": 0, "XS(SS)": 1, "S": 2, "M": 3, "L": 4, "XL(LL)": 5, "2XL(3L)": 6, "3XL(4L)": 7, "4XL(5L)以上": 8, "FREE SIZE": 9}
end
