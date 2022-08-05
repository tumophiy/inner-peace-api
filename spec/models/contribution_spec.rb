# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contribution, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:goal) }
    it { should belong_to(:user) }
  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      goal = create :goal
      old_contribution = create(:contribution, created_at: 1.hour.ago, goal_id: goal.id)
      recent_contribution = create(:contribution, goal_id: goal.id)

      expect(described_class.recent).to eq([recent_contribution, old_contribution])
      recent_contribution.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq([old_contribution, recent_contribution])
    end
  end
end
