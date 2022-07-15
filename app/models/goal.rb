# frozen_string_literal: true

class Goal < ApplicationRecord
  has_many :contributions
  validates :title, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :deadline, presence: true
  validates :interest_rate, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
