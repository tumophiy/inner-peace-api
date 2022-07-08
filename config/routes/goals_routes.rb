# frozen_string_literal: true

Rails.application.routes.draw do
  resources :goals, only: %w[index show create delete update]
end
