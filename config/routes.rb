Rails.application.routes.draw do
  root to: "home#top"
  get 'users/verify_age', to: 'users#verify_age'
  post 'users/verified', to: 'users#verified'
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get 'lands/top', to: 'lands#top'
  get 'lands/search', to: 'lands#search'
  get 'regions/search', to: 'regions#search'
  get 'biers/search', to: 'biers#search'
  get 'biers/search_by_name', to: 'biers#search_by_name'

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
 
  get "home/about" => "home#about"

  resources :users
  resources :posts


end
