# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    scope '/goals/:goals_id' do
      resources :contribution, only: %w[index show create delete update]
    end
  end
end
