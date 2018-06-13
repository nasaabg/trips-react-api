Rails.application.routes.draw do
  resources :trips
  resource :user, only: [:show]
  resources :users, only: [:index]
  get '/auth/github', to: 'authentication#github', format: false
end
