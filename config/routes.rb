Rails.application.routes.draw do
  root 'sessions#index'

  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/auth/facebook/callback' => 'sessions#omniauth'
  get '/ratings/five_star_ratings' => 'ratings#five_star_rating'
 
  resources :users, only: [:create, :show]
  resources :games, only: [:index, :new, :create, :show, :edit, :update]
  resources :ratings
  
  resources :games do 
    resources :ratings, only: [:new, :index]
  end 

  resources :users do 
    resources :ratings, only: [:show]   
  end
end
