Rails.application.routes.draw do
  get 'teams/index'
  get 'team/index'
  get 'home/index'
  get 'persons/profile'

  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :users, :controller => "users"

  resources :projects
  resources :tasks
  resources :posts
  resources :teams
  resources :persons

  root :to => "home#index"
end