# frozen_string_literal: true

module ApiHelpers
  def response_body
    JSON.parse(response.body).deep_symbolize_keys[:data]
  end

  def confirm_and_login_user(user)
    get '/users/confirm', params: { token: user.confirmation_token }
    post '/users/login', params: { email: user.email, password: 'password' }
    json['auth_token']
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in_user
    end
  end
end
