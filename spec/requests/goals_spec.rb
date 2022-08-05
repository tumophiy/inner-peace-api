# frozen_string_literal: true

require 'devise/jwt/test_helpers'
require 'rails_helper'

RSpec.describe 'Goals', type: :request do
  let(:user) { create(:user) }
  let(:goal) { create(:goal, user_id: user.id) }
  let(:goal_id) { goal.id }
  let(:base_route) { '/api/goals/' }
  let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  describe 'GET /index' do
    let!(:goals) { create_list(:goal, 10, user_id: user.id) }

    it 'returns all goals' do
      get base_route, headers: auth_headers
      expect(response).to be_successful
      expect(response_body.size).to eq(10)
    end
  end

  describe 'POST /create' do
    let(:invalid_params) { { goal: { amount: '', interest_rate: '', title: '', description: '', deadline: '' } } }
    let(:valid_params) do
      {
        goal: { amount: goal.amount, interest_rate: goal.interest_rate,
                title: goal.title, description: goal.description,
                deadline: goal.deadline, user_id: goal.user_id }
      }
    end

    context 'with valid params' do
      it 'returns the title' do
        post base_route, headers: auth_headers, params: valid_params, as: :json
        # binding.pry
        expect(response_body[:attributes][:title]).to eq(goal.title)
      end

      it 'returns the amount' do
        post base_route, headers: auth_headers, params: valid_params, as: :json
        expect(response_body[:attributes][:amount]).to eq(goal.amount)
      end

      it 'returns a created status' do
        post base_route, headers: auth_headers, params: valid_params, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns a unprocessable entity status' do
        post base_route, headers: auth_headers, params: invalid_params, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get "#{base_route}#{goal_id}", headers: auth_headers
      expect(response).to be_successful
    end

    it 'should return a response in proper format' do
      get "#{base_route}#{goal_id}", headers: auth_headers
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
    let(:invalid_params) { { goal: { amount: '', interest_rate: '', title: '', description: '', deadline: '' } } }
    let(:valid_params) do
      {
        goal: { amount: goal.amount, interest_rate: goal.interest_rate,
                title: goal.title, description: goal.description,
                deadline: goal.deadline }
      }
    end

    context 'with valid params' do
      it 'returns the title' do
        put "#{base_route}#{goal_id}", headers: auth_headers, params: valid_params, as: :json
        expect(response_body[:attributes][:title]).to eq(goal.title)
      end

      it 'returns the amount' do
        put "#{base_route}#{goal_id}", headers: auth_headers, params: valid_params, as: :json
        expect(response_body[:attributes][:amount]).to eq(goal.amount)
      end

      it 'returns a created status' do
        put "#{base_route}#{goal_id}", headers: auth_headers, params: valid_params, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns a unprocessable entity status' do
        put "#{base_route}#{goal_id}", headers: auth_headers, params: invalid_params, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'returns status code 204' do
      delete "#{base_route}#{goal_id}", headers: auth_headers
      expect(response).to have_http_status(204)
    end
  end
end
