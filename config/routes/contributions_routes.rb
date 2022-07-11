# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    scope '/goals/:goals_id' do
      resources :contribution, only: %i[create show index update destroy]
    end
  end
end
