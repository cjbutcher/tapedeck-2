Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  resources :spotify, only: [:index]
  get '/collections/:collection_id/spotify/search', to: 'spotify#search', as: :search_spotify

  resources :albums, only: [:destroy] do
    collection do
      get '/:spotify_id/play', to: 'albums#play', as: 'play'
    end
  end

  resources :users, only: [:show]

  resources :collections, only: [:show, :create, :edit, :update, :destroy] do
    collection do
      get :random
    end
    post '/reorder', to: 'collections#reorder', as: :reorder
    resources :albums, only: [:create] do
      collection do
        post :create_custom
      end
    end
  end

  resources :welcome, only: [:index]

  root to: 'welcome#about'

end
