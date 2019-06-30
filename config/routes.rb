Rails.application.routes.draw do
  root to: 'home#index'

  resource :garden, only: %i[show]
  resources :gardens, only: %i[new create]
  resource :trees, only: %i[show]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]
end
