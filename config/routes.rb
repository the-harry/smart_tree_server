Rails.application.routes.draw do
  root to: 'home#index'

  resources :gardens, only: %i[new create]
  resource :trees, only: %i[show]
  resources :trees, only: %i[new create]
end
