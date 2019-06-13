Rails.application.routes.draw do

  root 'static_pages#index'
  get  '/home',    to: 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/index', to: 'static_pages#index'
  get  '/index/:id', to: 'static_pages#index'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/newpost', to: 'microposts#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/likes/:micropost_id/create', to: 'likes#create'
  post '/likes/:micropost_id/destroy', to: 'likes#destroy'
  get '/users/:id/like', to: 'users#like'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:new, :create, :edit, :update, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  
end
