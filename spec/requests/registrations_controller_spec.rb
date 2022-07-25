# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::RegistrationsController', type: :request do
  let(:base_route) { '/api/users/' }
  let(:user_info) do
    {
      user:
      {
        email: 'user@example.org',
        password: 'password',
        password_confirmation: 'password'
      }
    }
  end

  describe 'sign_up' do
    it 'should return 200:0K' do
      expect { post base_route, params: user_info, as: :json }.to change(User, :count)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'successful login_user' do
    it 'should return token' do
      post base_route, params: user_info, as: :json
      get user_session_path, params: user_info, as: :json
      expect(response.header).to have_key('Authorization')
    end
  end

  describe 'successful log_out' do
    it 'should return token' do
      post base_route, params: user_info, as: :json
      get user_session_path, params: user_info, as: :json
      delete base_route, as: :json, headers: { Authorization: response.header['Authorization'] }
      expect(response).to have_http_status(:success)
    end
  end
end
