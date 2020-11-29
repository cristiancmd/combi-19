Rails.application.routes.draw do

  
  #get 'order/index'
  #get 'order/show'
  #get 'order/new'
  #devise_for :admins, path: 'admin'
  devise_for :admins, path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'register', edit: 'edit/profile'
    }
  get '/users/index', to: 'users#index'
  get '/users/show', to: 'users#show'
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
