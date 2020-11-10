Rails.application.routes.draw do

  get 'main/home'
  resources :chofers
  resources :trips
  resources :users
  resources :buses
  resources :routes
  resources :cities
  root 'main#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
