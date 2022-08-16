# frozen_string_literal: true

FactoryBot.define do
  factory :permission do
    can_index_goals { Faker::Boolean.boolean }
    can_update_goal { Faker::Boolean.boolean }
    can_delete_goal { Faker::Boolean.boolean }
    can_create_goal { Faker::Boolean.boolean }
    can_see_contribution { Faker::Boolean.boolean }
    can_index_contributions { Faker::Boolean.boolean }
    can_delete_contribution { Faker::Boolean.boolean }
    can_create_contribution { Faker::Boolean.boolean }
    association :role_id
  end
end
