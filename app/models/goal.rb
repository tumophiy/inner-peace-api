# frozen_string_literal: true

class Goal < ApplicationRecord
  validates :title, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :interest_rate, presence: true
end
