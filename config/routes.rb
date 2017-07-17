Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index", as: 'root'
  get '/users/login', to: "user_sessions#new", as: 'users_login'
  post '/users/login', to: "user_sessions#create"
  get '/vendors/login', to: 'vendor_sessions#new', as: 'vendors_login'
  post '/vendors/login', to: 'vendor_sessions#create'
  delete '/users/logout', to: 'user_sessions#destroy', as: 'users_logout'
  delete '/vendors/logout', to: 'vendor_sessions#destroy', as: 'vendors_logout'
  get '/vendors/:id/gigs', to: 'vendors#gigs', as: 'vendor_gigs'
  get '/vendors/:id/responses', to: 'vendors#responses', as: 'vendor_responses'

  get '/users/:id/posts', to: 'users#posts', as: 'user_posts'
  get '/vendors/:id/reviews', to: 'vendors#reviews', as: 'vendor_reviews'
  get '/posts/:id/messages', to: 'posts#messages', as: 'message'
  get '/index', to: 'searches#index', as: 'index_search'
  get '/search', to: 'searches#new', as: 'new_search'
  get '/show_search', to: 'searches#show_search', as: 'show_searches'
  post '/search', to: 'searches#create'
  post '/vendors/:id/add_service', to: 'vendors#add_service', as: 'add_service'

  get '/search', to: 'searches#new', as: "search_new"

  resources :responses, only: [:new,:create,:destroy]
  resources :users, :vendors, :posts, :reviews
  resources :messages, only: [:create]
  resources :searches, only: [:show, :show_search, :create]
end
