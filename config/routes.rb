Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index", as: 'root'
  get '/users/login', to: "user_sessions#new", as: 'users_login'
  post '/users/login', to: "user_sessions#create"
  get '/vendors/login', to: 'vendor_sessions#new', as: 'vendors_login'
  post '/vendors/login', to: 'vendor_sessions#create'
  delete '/users/logout', to: 'user_sessions#destroy', as: 'users_logout'
  delete '/vendors/logout', to: 'vendor_sessions#destroy', as: 'vendors_logout'

  get '/users/:id/posts', to: 'users#posts', as: 'user_posts'

  resources :responses, only: [:new,:create,:destroy]
  resources :users, :vendors, :posts
end
