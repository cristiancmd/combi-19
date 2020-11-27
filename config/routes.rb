Rails.application.routes.draw do

  
  #devise_for :admins, path: 'admin'
  devise_for :admins, path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'register', edit: 'edit/profile'
    }
  devise_for :users
  get 'main/home'
  resources :chofers
  resources :trips
  resources :buses
  resources :routes
  resources :cities
  resources :additionals
  resources :searches
  root 'main#home'
  




end
