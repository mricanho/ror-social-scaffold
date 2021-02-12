Rails.application.routes.draw do

  root 'posts#index'
  get '/notifications', to: 'users#user_notifications', as: 'user_notifications'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:create, :show, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
