Rails.application.routes.draw do

  namespace :admin do
    # get '/dashboard', to: 'admin#index'
    resources :admin, only: [:index]
    match '/dashboard', to: 'admin#index', :via => :get, as: :dashboard
    #^this doesn't seem right with the rails routes

    #could not get the below to work due to prefix paths coming up incorrectly
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    # get 'items/new', to: 'admin/items#new', as: :new
    # post '/admin/items', to: 'admin/items#create'
    # get '/admin/items/:id', as: :admin_item, to: 'admin/items#show'
    # get '/admin/items', as: :items, to: 'admin/items#index'
    # get '/admin/items/:id', to: 'admin/items#edit'
    # put '/admin/items', to: 'admin/items#update'
    # patch '/admin/items', to: 'admin/items#update'

  end

  # resources :items, only: [:index, :show] - ORIGINAL ROUTE FROM PROJECT
  get '/items/:id', as: :item, to: 'items#show'
  get '/items', to: 'items#index'

  # resources :carts, only: [:create]
  post '/carts', to: 'carts#create'

  # resources :users, only: [:new, :create]
  get '/users/new', as: :new_user, to: 'users#new'
  post '/users', to: 'users#create'

  # resources :orders, only: [:index, :show, :create, :update]
  get '/orders/:id', as: :order, to: 'orders#show'
  get '/orders', to: 'orders#index'
  put '/orders/:id', to: 'orders#update'
  patch '/orders/:id', to: 'orders#update'
  post '/orders', to: 'orders#create'

  # get '/edit_account', to: 'users#edit'
  # patch '/update_account', to: 'users#update'
  # delete '/delete_account', to: 'users#destroy'
  # get '/dashboard', to: 'users#show'
  resources :users, only: [:edit, :update, :destroy, :show]
  match '/edit_account', to: 'users#edit', :via => :get
  match '/update_account', to: 'users#update', :via => :put
  match '/update_account', to: 'users#update', :via => :patch
  match '/delete_account', to: 'users#destroy', :via => :delete
  match '/dashboard', to: 'users#show', :via => :get


  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  match '/login', to: 'sessions#new', :via => :get, as: :login
  match '/login', to: 'sessions#create', :via => :post
  match '/logout', to: 'sessions#destroy', :via => :delete, as: :logout

  patch '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  get '/cart', to: 'carts#index'
  # resources :carts, only: [:index, :update, :destroy] note - couldn't get these to work
  # match '/cart', to: 'carts#index', :via => :get
  # match '/cart', to: 'carts#update', :via => :patch
  # match '/cart', to: 'carts#destroy', :via => :delete

  # get '/admin', to: 'sessions#new' - ORIGINAL
  match '/admin', to: 'sessions#new', :via => :get, as: :admin


  #note - not sure how to get custom http verbs to show using resources
  get '/about', to: 'categories#about'
  # get '/:category_title', to: 'categories#show'
  resources :categories, only: [:show]
  match '/:category_title', to: 'categories#show', :via => :get

  root to: 'welcome#index'
end
