Rails.application.routes.draw do
  get 'reports/index'
  devise_for :users
  get 'teams/index'
  get 'team/index'
  get 'home/index'
  get 'persons/profile'

  get 'tasks/status/:status', to: 'tasks#index', as: 'task_by_filter'

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "persons"

  resources :projects
  resources :tasks
  resources :posts
  resources :reports

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
    resources :tasks
  end

  root :to => "home#index"
end