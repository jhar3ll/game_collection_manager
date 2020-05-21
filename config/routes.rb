Rails.application.routes.draw do

    get '/' => 'sessions#index'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/games' => 'games#new'
    post '/games' => 'games#create'
    get '/games/:id' => 'games#show'
    delete '/logout' => 'sessions#destroy'
    get '/platforms' => 'platforms#index'

  resources :ratings
  resources :games
  resources :platforms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
