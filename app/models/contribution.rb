class Contribution < ApplicationRecord
  validates :amount, presence: true
  validates :description, presence: true
end
