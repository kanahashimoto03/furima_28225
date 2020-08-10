FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password
    password { password }
    password_confirmation { password }
    family_name { '橋本' }
    last_name { '佳奈' }
    family_name_reading { 'ハシモト' }
    last_name_reading { 'カナ' }
    birthday { Faker::Date.birthday }
  end
end
