# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  resources :goals, only: %w[index show create delete update]
  scope 'api' do
    scope '/goals/:goals_id' do
      resources :contribution, only: %w[index show create delete update]
    end
  end
end
