Rails.application.routes.draw do
  mount Iconsole::Engine, at: '/'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'home/dashboard'
  get 'home/planning'
  get 'home/setting'
  get 'home/sharing'


  resources :holds
  resources :trades
  resources :stoploss_frames
  resources :time_frames

  # Defines the root path route ("/")
  root "home#dashboard"
end
