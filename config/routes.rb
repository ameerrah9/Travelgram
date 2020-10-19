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

  #omniauth callback route
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :cities
   resources :blogs do
     resources :comments
   end
  resources :comments
  resources :users do

    resources :blogs, only: [:new, :create, :index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
