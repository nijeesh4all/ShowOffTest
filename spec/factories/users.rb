FactoryBot.define do
  factory :user do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    first_name { Faker::Internet.email }
    password { 'password'}
    password_confirmation { 'password'}
    image_url { Faker::Avatar.image }
  end
end
