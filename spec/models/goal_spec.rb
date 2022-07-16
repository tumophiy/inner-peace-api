# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:deadline) }
    it { is_expected.to validate_presence_of(:interest_rate) }
    it { is_expected.to validate_numericality_of(:amount) }
  end

  describe 'has many associated' do
    it { should have_many(:contributions) }
  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      old_goal = create :goal
      newer_goal = create :goal
      expect(described_class.recent).to eq([newer_goal, old_goal])
      newer_goal.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq([old_goal, newer_goal])
    end
  end
end
