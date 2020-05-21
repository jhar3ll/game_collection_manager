Rails.application.routes.draw do

  resources :genres
    get '/' => 'sessions#index'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/games/new' => 'games#new'
    post '/games' => 'games#create'
    get '/games/:id' => 'games#show'
    delete '/logout' => 'sessions#destroy'
    get '/platforms' => 'platforms#index'
    get '/users/:id' => 'users#show'


  resources :ratings
  resources :games do 
    resources :ratings, only: [:new, :index]
  end 
  resources :platforms
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
