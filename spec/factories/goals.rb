# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    amount { 1000 }
    interest_rate { 10 }
    title { 'MyString' }
    description { 'MyText' }
    deadline { '2022-06-15' }
  end
end
