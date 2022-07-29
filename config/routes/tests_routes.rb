# frozen_string_literal: true

Rails.application.routes.draw do
  get '/member-data', to: 'members#show'
end
