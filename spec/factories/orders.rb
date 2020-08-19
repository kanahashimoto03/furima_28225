FactoryBot.define do
  factory :order do
    postal_code { '447-1234' }
    prefecture_id { 3 }
    city { '刈谷市' }
    house_number { '野田町' }
    building_name { 'アスティオス' }
    phone_number{ '08069345678' }
  end
end
