Wdim::Application.routes.draw do

  resources :users do
    resources :avatars, only: [:index, :new, :create, :update]
    resources :messages, only: [:new, :create, :update]
  end

  resources :avatars, only: [:show, :edit, :destroy]
  resources :messages, only: [:index, :show, :edit, :destroy]

  resources :banners
  resources :sessions

  get       "login"   => "sessions#new", as: "log_in"
  root      to: "sessions#new"
end
