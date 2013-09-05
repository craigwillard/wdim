Wdim::Application.routes.draw do
  resources :users
  resources :banners
  resources :sessions

  get "login"   => "sessions#new",     as: "log_in"
end
