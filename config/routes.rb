Rails.application.routes.draw do
  devise_for :users
  get 'teams/index'
  get 'team/index'
  get 'home/index'
  get 'persons/profile'

  get 'tasks/:status', to: 'tasks#index'
  get 'tasks/person/:user_id', to: 'tasks#task_on_user', as: :task_on_user

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "persons"

  resources :projects
  resources :tasks
  resources :posts

  resources :persons do
    resources :tasks
  end

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