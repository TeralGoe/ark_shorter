FactoryBot.define do
  factory :shorter do
    original_url { Faker::Internet.url }
  end
end
