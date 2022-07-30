# frozen_string_literal: true

FactoryBot.define do
  factory :role_permission do
    permission_id { (create :permission).id }
    role_id { (create :role).id }
  end
end
