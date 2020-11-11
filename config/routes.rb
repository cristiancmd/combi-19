Rails.application.routes.draw do

  get 'main/home'
  resources :chofers
  resources :trips
  resources :users
  resources :buses
  resources :routes
  resources :cities
  
  root 'main#home'
  
  #root "cities#index"




end
