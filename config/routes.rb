Rails.application.routes.draw do
  # write custom routes here
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  #resources :cities
  resources :comments
  resources :users do
    resources :trips, only [:index]
  end
  resources :trips do
    resources :comments, only [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
