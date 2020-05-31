Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :posts

  root 'posts#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  
  get '/posts', to: 'posts#index', as: :posts
  get '/posts/filter/:category_id', to: 'posts#filter', as: :filtered_posts
  get '/posts/new', to: 'posts#new', as: :new_post
  get '/posts/:id', to: 'posts#show', as: :post
  post '/posts', to: 'posts#create'
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#delete'


  get '/categories', to: 'categories#index', as: :categories
  get '/categories/new', to: 'categories#new', as: :new_category
  get '/categories/:category_id', to: 'categories#show', as: :category
  post '/categories', to: 'categories#create'
  get '/categories/:category_id/edit', to: 'categories#edit', as: :edit_category
  patch '/categories/:category_id', to: 'categories#update'
  delete '/categories/:category_id', to: 'categories#delete'
end
