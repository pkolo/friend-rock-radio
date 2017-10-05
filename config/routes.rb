Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shows#index'

  resources :shows, only: [:index, :show] do
    resources :episodes, only: [:index, :show]
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    resources :shows, only: [:edit] do
      resources :episodes, only: [:new, :create, :edit, :update]
    end

    resources :episodes, only: [:edit] do
      resources :playlists, only: [:new, :create]
    end

    resources :tracks, only: [:create]
    resources :bands, only: [:create]
    resources :labels, only: [:create]
    resources :genres, only: [:create]
  end
end
