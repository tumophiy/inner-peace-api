# frozen_string_literal: true

FactoryBot.define do
  factory :contribution do
    amount { 1 }
    description { 'MyString' }
    expected_date { '2022-06-22' }
    association :goal_id
  end
end
