class ContributionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :description
end
