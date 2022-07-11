# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contributions' do
  describe '#index' do
    let(:goal) { create :goal }
    it 'returns a success code' do
      request_get
      expect(response).to have_http_status(:ok)
    end

    it 'reterns a proper JSON' do
      contribution = new_contribution
      request_get
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(contribution.id.to_s)
        expect(expected[:type]).to eq('contribution')
        expect(expected[:attributes]).to eq(
          amount: contribution.amount,
          description: contribution.description
        )
      end
    end

    it 'returns contributions in proper order' do
      old_contribution = create(:contribution, created_at: 1.hour.ago, goal_id: goal.id)
      recent_contribution = new_contribution
      request_get
      ids = json_data.map { |item| item[:id].to_i }
      expect(ids).to eq([recent_contribution.id, old_contribution.id])
    end
  end

  private

  def new_contribution
    contribution = create(:contribution, goal_id: goal.id)
  end

  def request_get
    get '/contributions'
  end
end
