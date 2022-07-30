# frozen_string_literal: true

FactoryBot.define do
  factory :permission do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
