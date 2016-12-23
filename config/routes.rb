Rails.application.routes.draw do

  resources :spotify, only: [:index] do
    collection do
      post :search
    end
  end

  resources :albums, only: [] do
    collection do
      get '/:spotify_id/play', to: 'albums#play', as: 'play'
    end
  end

  resources :collections, only: [:show, :create] do
    resources :albums, only: [:create]
  end

  resources :welcome, only: [:index]

  root to: 'welcome#index'

end
