Rails.application.routes.draw do
  resources :chofers
  resources :trips
  resources :users
  resources :buses
  resources :routes
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
