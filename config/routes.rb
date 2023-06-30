require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  default_url_options :host => "kulovanshi@bestpeers.com"
  get 'stories/create'
  get 'stories/show'
  get 'stories/new'
  get 'stories/index'
  get 'strories/create'
  get 'strories/show'
  get 'profiles/index'
  get 'images/index'
  devise_for :users
  get 'homes/index'
  root "homes#index"
  get 'users/search', to: "users#search"
  resources :posts do
    post 'like', to: 'likes#like'
    delete 'unlike', to: 'likes#unlike'
  end
  resources :my_profiles
  resources :users
  resources :followers
  resources :profile
  resources :likes
  resources :stories
  resources :comments
  post 'profile/:id/follow', to: 'profile#follow',as: 'follow'
  post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
  post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
  post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'
  post 'profile/:id/block', to: 'profile#block', as: 'block'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
