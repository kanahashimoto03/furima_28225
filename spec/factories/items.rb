FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence }
    name { Faker::Lorem.sentence }
    item_description { Faker::Lorem.sentence }
    item_category_id { Faker::Number.number }
    item_condition_id { Faker::Number.number }
    shipping_charge_id { Faker::Number.number }
    shipping_area_id { Faker::Number.number }
    delivery_time_id { Faker::Number.number }
    item_price { Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
