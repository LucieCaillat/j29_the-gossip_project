Rails.application.routes.draw do
  root 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
