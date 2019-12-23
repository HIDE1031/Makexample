Rails.application.routes.draw do
  root 'tops#index'
  
  resources :users
  
  get 'sessions/new'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  
  resources :mypages
  resources :posts
  resources :searches
end
