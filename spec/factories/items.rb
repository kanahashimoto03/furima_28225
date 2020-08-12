FactoryBot.define do
  factory :item do
    name { 'クッキー' }
    item_description { '美味しいクッキー' }
    item_category_id { 123 }
    item_condition_id { 123 }
    shipping_charge_id { 123 }
    shipping_area_id { 123 }
    delivery_time_id { 123 }
    item_price { 500 }
    association :user
  end
end
