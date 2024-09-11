Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Iconsole::Engine, at: '/'
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

  get 'home/dashboard'
  get 'home/planning'
  get 'home/setting'
  get 'home/sharing'


  resources :user_profiles
  resources :holds
  resources :trades
  resources :stoploss_frames

  # Defines the root path route ("/")
  root "home#dashboard"
end
