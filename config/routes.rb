Rails.application.routes.draw do

  resources :genres
    get '/' => 'sessions#index'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    get '/auth/facebook/callback' => 'sessions#omniauth'
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'

    get '/games/new' => 'games#new'
    get '/games' => 'games#index', as: :games
    get '/games/:id' => 'games#show'
    post '/games' => 'games#create'
    

    get '/users/' => 'users#index'
    get '/users/:id' => 'users#show'
    get '/users/:id/ratings' => 'ratings#show'

  
    
    get '/ratings/five_stars' => 'ratings#index'
    get '/ratings/' => 'ratings#show'

    root 'session#index'
    
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
