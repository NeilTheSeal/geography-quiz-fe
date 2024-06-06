FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    user_id { Faker::Number.between(
      from: 1_000_000_000,
      to: 9_999_999_999
    ).to_s}
  end
end
