Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shows#index'

  resources :shows, only: [:index, :show] do
    resources :episodes, only: [:index, :new, :create, :show, :edit, :update]
  end

  resources :episodes, only: [] do
    resources :playlists, only: [:create]
  end

  resources :tracks, only: [:create]
  resources :bands, only: [:create]
end
