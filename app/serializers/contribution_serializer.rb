# frozen_string_literal: true

class ContributionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :description
end
