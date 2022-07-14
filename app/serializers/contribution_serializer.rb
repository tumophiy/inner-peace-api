# frozen_string_literal: true

class ContributionSerializer
  include JSONAPI::Serializer

  attributes :amount, :description
  belongs_to :goal
end
