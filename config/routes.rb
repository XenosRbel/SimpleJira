Rails.application.routes.draw do
  devise_for :users
  get 'teams/index'
  get 'team/index'
  get 'home/index'
  get 'persons/profile'

  # devise_for :user
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :users, :controller => "users"

  resources :projects
  resources :tasks
  resources :posts
  resources :user

  resources :teams do
    resources :user
  end
  resources :persons

  root :to => "home#index"
end