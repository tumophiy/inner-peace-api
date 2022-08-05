# frozen_string_literal: true

class Contribution < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  validates :amount, presence: true
  validates :description, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
