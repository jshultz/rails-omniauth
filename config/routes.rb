Rails.application.routes.draw do

  root :to => "home#index"

  resources :tickets

  resources :tasks


  namespace :api, defaults: {format: :json} do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      devise_scope :user do
        match '/sessions' => 'sessions#create', :via => :post
        match '/sessions' => 'sessions#destroy', :via => :delete
      end
    end
    resources :properties, only: [:index, :create, :update, :destroy, :show] do
      resources :tickets, only: [:index, :create, :update, :destroy]
    end
  end

  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
