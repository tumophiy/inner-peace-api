# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    resources :goals, only: %i[create show index update destroy]
  end
end
