Rails.application.routes.draw do

  
  devise_for :users
  get 'main/home'
  resources :chofers
  resources :trips
  resources :buses
  resources :routes
  resources :cities
  
  root 'main#home'
  




end
