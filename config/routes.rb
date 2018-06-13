Rails.application.routes.draw do
  resources :users
  get '/auth/github', to: 'authentication#github', format: false
end
