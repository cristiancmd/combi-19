Rails.application.routes.draw do

  
  #devise_for :chofers
  #get 'order/index'
  #get 'order/show'
  #get 'order/new'
  #devise_for :admins, path: 'admin'
  default_url_options :host => "localhost:3000"

  devise_for :admins, path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'register', edit: 'edit/profile'
    }
  devise_for :chofers, path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'register', edit: 'edit/profile'
    }  
  get '/users/index', to: 'users#index'
  get '/users/show', to: 'users#show'
  get '/orders/past_trips', to: 'orders#past_trips'
  get '/orders/cancel_order', to: 'orders#cancel_order'
  get '/trips/cancel', to: 'trips#cancel'
  get '/orders/venta_chofer', to: 'orders#venta_chofer'
  get '/orders/create_efectivo', to: 'orders#create_efectivo'

  devise_for :users
  get 'main/home'
  resources :chofers
  resources :trips
  resources :buses
  resources :routes
  resources :cities
  resources :additionals
  resources :searches #, shallow: true do
    #resources :orders
  #end

  resources :orders

  root 'trips#index'
  




end
