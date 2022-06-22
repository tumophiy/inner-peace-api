class Contribution < ApplicationRecord
  has_one :goal
  validates :amount, presence: true
  validates :description, presence: true
end
