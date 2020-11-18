Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/new'
  
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create] do
   resources :articles
    # resources :orders, only: [:index, :create]
  end
end