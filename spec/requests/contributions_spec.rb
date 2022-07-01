require 'rails_helper'

RSpec.describe 'Contributions' do
  describe '#index' do
    it 'returns a success code' do
      get '/contributions'
      expect(response).to have_http_status(:ok)
    end

    it 'reterns a proper JSON' do
      goal = create :goal
      contribution = create :contribution
      get '/contributions'
      body = JSON.parse(response.body)
      expect(body).to eq(
        data: [
          id: contribution.id,
          type: 'contributions',
          attributes: {
            amount: contribution.amount,
            description: contribution.description
          }
        ]
      )
    end
  end
end
