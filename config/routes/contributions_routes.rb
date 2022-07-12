# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    scope '/goals/:goal_id' do
      resources :contributions, only: %i[create show index update destroy]
    end
  end
end
