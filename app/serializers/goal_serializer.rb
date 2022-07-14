# frozen_string_literal: true

class GoalSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :amount, :interest_rate
  has_many :contributions
end
