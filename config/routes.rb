Rails.application.routes.draw do
  root to: 'home#index'

  get '/gardens', to: 'gardens#all'
  get 'garden/search', to: 'gardens#search', as: 'search_garden'
  post 'garden/search', to: 'gardens#lookup'
  get 'garden/:id', to: 'gardens#show', as: 'show_garden_path'
  resources :gardens, only: %i[new create]
  resource :trees, only: %i[show]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]
end
