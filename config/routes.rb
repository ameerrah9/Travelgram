Rails.application.routes.draw do
  # write custom routes here
  get '/signup' => 'users#new'
  
  #resources :cities
  resources :comments
  resources :users
  resources :trips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
