# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    title { 'MyString' }
    description { 'MyText' }
    deadline { '2022-06-15' }
  end
end
