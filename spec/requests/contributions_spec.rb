require 'rails_helper'

RSpec.describe 'Contributions' do
  describe '#index' do
    it 'returns a success code' do
      get '/contributions'
      expect(response).to have_http_status(:ok)
    end

    it 'reterns a proper JSON' do
      goal = create :goal
      contribution = create(:contribution, goal_id: goal.id)
      get '/contributions'
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
  end
end
