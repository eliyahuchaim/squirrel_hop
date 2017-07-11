Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index", as: 'root'
  get '/users/login', to: "user_sessions#new", as: 'user_login'
  post '/users/login', to: "user_sessions#create"
  get '/vendors/login', to: 'vendor_sessions#new', as: 'vendor_login'
  post '/vendors/login', to: 'vendor_sessions#create'
  get '/users/logout', to: 'user_sessions#destroy', as: 'user_logout'
  get '/vendors/logout', to: 'vendor_sessions#destroy', as: 'vendor_logout'


  resources :responses, only: [:new,:create,:destroy]
  resources :users, :vendors, :posts
end
