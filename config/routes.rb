Rails.application.routes.draw do
  
  resources :places
  resources :interactions
  resources :businesses
  resources :users

  get "/places/:zip/:radius/:category", to: "places#retrieve"
  get "/places/:zip/:radius", to: "places#retrieve"

  post "/login", to: "sessions#create"
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy"

  get "/users/:id/interactions", to: "interactions#userInt"
  post "/users/:id/interactions/:business", to: "interactions#interact"

  get "/errors", to: "interactions#errlist"

  # Routing logic: fallback requests for React Router. Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  #Graveyard
  
    # get "/sessions", to: "sessions#index"
end
