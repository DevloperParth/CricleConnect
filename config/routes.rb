Rails.application.routes.draw do
  get 'profiles/index'
  get 'images/index'
  devise_for :users
  get 'homes/index'
  root "homes#index"
  resources :posts do
    post 'like', to: 'likes#like'
    delete 'unlike', to: 'likes#unlike'
  end
  get '/search', to: "users#search" 
  resources :likes
  resources :comments, only: [:index, :create, :destroy], shallow: true

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
