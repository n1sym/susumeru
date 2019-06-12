Rails.application.routes.draw do

  root 'static_pages#index'
  get  '/home',    to: 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/index', to: 'static_pages#index'
  get  '/novel',   to: 'static_pages#novel'
  get  '/comic',   to: 'static_pages#comic'
  get  '/web_novel',   to: 'static_pages#web_novel'
  get  '/web_comic',   to: 'static_pages#web_comic'
  get  '/anime',   to: 'static_pages#anime'
  get  '/movie',   to: 'static_pages#movie'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/newpost', to: 'microposts#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/likes/:micropost_id/create', to: 'likes#create'
  post '/likes/:micropost_id/destroy', to: 'likes#destroy'
  
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
