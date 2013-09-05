Wdim::Application.routes.draw do
  resources :avatars


  resources :users
  resources :banners
  resources :sessions

  get       "login"   => "sessions#new", as: "log_in"
  root      to: "sessions#new"
end
