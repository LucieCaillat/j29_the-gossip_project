Rails.application.routes.draw do
  get 'cities/show'
  resources :gossips
  root 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:show]
end
