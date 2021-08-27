Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :bloods, only: [:index, :new, :show, :create] do
    resources :donations, only: [:create]
  end
  get '/my_donations', to: 'pages#my_donations', as: :my_donations
  # get '/my_donations', to: 'pages#my_donations'
  get '/all_donations', to: 'pages#all_donations'
end
