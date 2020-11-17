Rails.application.routes.draw do

  
  devise_for :users
  get 'main/home'
  resources :chofers
  resources :trips
  resources :buses
  resources :routes
  resources :cities
  resources :additionals

  root 'main#home'
  




end
