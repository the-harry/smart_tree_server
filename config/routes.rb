Rails.application.routes.draw do
  root to: 'home#index'

  get 'search', to: 'home#search'

  get 'gardens', to: 'gardens#all'
  get 'garden/:id', to: 'gardens#show', as: 'show_garden_path'

  get 'trees', to: 'trees#all'
  get 'tree/:id', to: 'trees#show', as: 'show_tree_path'

  resources :gardens, only: %i[new create]
  resources :trees, only: %i[new create]
  resources :prunes, only: %i[new create]

  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      post 'metrics(.:format)', to: 'metrics#create'
    end
  end
end
