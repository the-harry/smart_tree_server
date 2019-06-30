Rails.application.routes.draw do
  root to: 'home#index'

  get 'gardens', to: 'gardens#all'
  get 'garden/search', to: 'gardens#search', as: 'search_garden'
  post 'garden/search', to: 'gardens#lookup'
  get 'garden/:id', to: 'gardens#show', as: 'show_garden_path'

  get 'trees', to: 'trees#all'
  get 'tree/search', to: 'trees#search', as: 'search_tree'
  post 'tree/search', to: 'trees#lookup'
  get 'tree/:id', to: 'trees#show', as: 'show_tree_path'

  resources :gardens, only: %i[new create]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]
end
