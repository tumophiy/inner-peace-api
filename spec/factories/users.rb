# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }

    trait :admin do
      is_admin { true }
    end
  end
end
