Rails.application.routes.draw do
  root to: 'home#index'

  get '/gardens', to: 'gardens#all'
  get 'garden/:id', to: 'gardens#show', as: 'show_garden_path'
  resources :gardens, only: %i[new create]
  resource :trees, only: %i[show]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]
end
