Rails.application.routes.draw do
  resources :chofers
  resources :trips
  resources :users
  resources :buses
  resources :routes
  resources :cities
  
  root "cities#index"

  

  #get "cities" => "cities#create" # button_to
  #post "cities" => "cities#edit" # y link_to
  #post "cities" => "cities#create" # button_to
  #post "cities/new" => "cities#new" # y link_to

end
