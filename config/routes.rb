Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create] do
   resources :articles
    # resources :orders, only: [:index, :create]
  end
end