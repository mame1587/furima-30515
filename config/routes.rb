Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/new'
  
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create, :destroy] do
    resources :orders, only: [:index, :create]
  end
end