Rails.application.routes.draw do

  resources :genres
    get '/' => 'sessions#index'
    get '/users/new' => 'users#new'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    get '/games/new' => 'games#new'
    post '/games' => 'games#create'
    get '/games' => 'games#index'
    get '/games/:id' => 'games#show'
    delete '/games/:id' => 'games#destroy'
    delete '/logout' => 'sessions#destroy'
    get '/platforms' => 'platforms#index'
    get '/users/' => 'users#index'
    get '/users/:id' => 'users#show'
    get '/users/:id/ratings' => 'ratings#show'
    get '/auth/facebook/callback' => 'sessions#omniauth'
    get '/users/most_rated' => 'users#index'
    get '/ratings/five_stars' => 'ratings#index'


  resources :ratings
  resources :games do 
    resources :ratings, only: [:new, :index]
  end 
  resources :platforms
  resources :users do 
    resources :ratings, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
