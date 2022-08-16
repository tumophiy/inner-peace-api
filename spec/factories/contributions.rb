# frozen_string_literal: true

FactoryBot.define do
  factory :contribution do
    amount { Faker::Number.number(digits: 3) }
    description { Faker::Lorem.sentence }
    expected_date { Faker::Date.forward(days: 23) }
    association :goal_id
    association :user_id
  end
end
