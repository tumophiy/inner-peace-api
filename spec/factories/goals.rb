# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    amount { Faker::Number.number(digits: 6) }
    interest_rate { Faker::Number.between(from: 0.0, to: 100) }
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    deadline { Faker::Date.between(from: 1.years.since, to: 10.years.since) }
  end
end
