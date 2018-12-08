FactoryBot.define do
  factory :visitor do
    ip { Faker::Internet.ip_v4_address }
    country { Faker::Address.country }
    shorter
  end
end
