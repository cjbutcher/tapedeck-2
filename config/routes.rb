Rails.application.routes.draw do

  resources :spotify, only: [:index] do
    collection do
      post :search
    end
  end

  resources :tapes, only: [] do
    member do
      get :play
    end
  end

  root to: 'spotify#index'

end
