# frozen_string_literal: true

Rails.application.routes.draw do
  resources :continents, only: %i[index show]
  resources :trips do
	  get 'my_trips', on: :collection
  end
  resource :user, only: [:show]

  resources :users, only: [:index]
  get '/auth/github', to: 'authentication#github', format: false
end
