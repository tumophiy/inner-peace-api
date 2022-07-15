# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Goals', type: :request do
  let(:goal) { create :goal }
  let(:goal_id) { goal.id }
  let(:base_route) { '/api/goals/' }

  describe 'GET /index' do
    before do
      create_list(:goal, 10)
    end

    it 'returns all goals' do
      get base_route
      expect(response).to be_successful
      expect(response_body.size).to eq(10)
    end
  end

  describe 'POST /create' do
    let(:params) { { goal: { amount: '', interest_rate: '', title: '', description: '', deadline: '' } } }
    context 'with valid params' do
      before do
        params = { goal: { amount: goal.amount, interest_rate: goal.interest_rate,
                           title: goal.title, description: goal.description, deadline: goal.deadline } }
        post base_route, params: params, as: :json
      end

      it 'returns the title' do
        expect(response_body[:attributes][:title]).to eq(goal.title)
      end

      it 'returns the amount' do
        expect(response_body[:attributes][:amount]).to eq(goal.amount)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      before do
        post base_route, params: params, as: :json
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get "#{base_route}#{goal_id}"
      expect(response).to be_successful
    end

    it 'should return a response in proper format' do
      get "#{base_route}#{goal_id}"
      expected = response_body
      aggregate_failures do
        expect(expected[:id]).to eq(goal.id.to_s)
        expect(expected[:type]).to eq('goal')
        expect(expected[:attributes][:title]).to eq(goal.title)
        expect(expected[:attributes]).to eq(
          description: goal.description,
          amount: goal.amount,
          interest_rate: goal.interest_rate,
          title: goal.title
        )
      end
    end
  end

  describe 'PUT /update' do
    let(:params) { { goal: { amount: '', interest_rate: '', title: '', description: '', deadline: '' } } }
    context 'with valid params' do
      before do
        params = { goal: { amount: goal.amount, interest_rate: goal.interest_rate,
                           title: goal.title, description: goal.description, deadline: goal.deadline } }
        put "#{base_route}#{goal_id}", params: params, as: :json
      end

      it 'returns the title' do
        expect(response_body[:attributes][:title]).to eq(goal.title)
      end

      it 'returns the amount' do
        expect(response_body[:attributes][:amount]).to eq(goal.amount)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      before do
        put "#{base_route}#{goal_id}", params: params, as: :json
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      delete "#{base_route}#{goal_id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
