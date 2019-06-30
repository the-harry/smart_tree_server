Rails.application.routes.draw do
  root to: 'home#index'

  get '/gardens', to: 'gardens#all'
  resources :gardens, only: %i[new create]
  resource :trees, only: %i[show]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]
end
