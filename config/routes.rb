Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  root to: "tasks#index"
  resources :tasks
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  resources :users, only: [:index, :show, :create]


end
