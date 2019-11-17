FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "chukwuma_adebayor#{n}@example.com" }
    full_name { "Chukwuma Adebayor" }
    password { "topsecret" }
  end
end