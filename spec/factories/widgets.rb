FactoryBot.define do
  factory :widget do
    name { "RSPEC:" + Faker::Alphanumeric.alphanumeric }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote }
    kind { 'visible' }
    trait :hidden do
      kind { 'hidden' }
    end

  end
end
