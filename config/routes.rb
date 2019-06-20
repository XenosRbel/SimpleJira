Rails.application.routes.draw do
  devise_for :users
  get 'teams/index'
  get 'team/index'
  get 'home/index'
  get 'persons/profile'

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "persons"

  resources :projects
  resources :tasks
  resources :posts

  # resources :user

  resources :persons

  resources :posts do
    resources :comments
  end
  resources :teams do
    resources :persons
  end

  resources :projects do
    resources :posts do
      resources :comments
    end
    resources :teams do
      resources :users do
        resources :tasks
      end
    end
  end

  root :to => "home#index"
end