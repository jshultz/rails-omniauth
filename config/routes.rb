Rails.application.routes.draw do

  root :to => "home#index"

  resources :tickets

  resources :tasks


  namespace :api, defaults: {format: :json} do
    resources :properties, only: [:index, :create, :update, :destroy, :show] do
      resources :tickets, only: [:index, :create, :update, :destroy]
    end
    resources :task_lists, only: [:index, :create, :update, :destroy, :show] do
      resources :tasks, only: [:index, :create, :update, :destroy]
    end
  end

  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
