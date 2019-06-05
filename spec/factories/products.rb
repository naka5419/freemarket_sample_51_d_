FactoryBot.define do
  factory :product do
    id { 1 }
    name {"トレーナー"}
    description {"服です"}
    condition { 0 }
    shipping_cost {"0"}
    shipping_method {"ゆうパック"}
    source_area {"大阪"}
    shipping_days {"3日"}
    price {"300"}
    status {"0"}
    bland_id { 1 }
    seller_id { 1 }
  end
end