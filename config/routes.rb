Rails.application.routes.draw do
  
  resources :places
  resources :interactions
  resources :businesses
  resources :users
  post "/login", to: "sessions#create"
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy"
  get "/sessions", to: "sessions#index"
  get "/users/:id/interactions", to: "interactions#userInt"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  #API fetching
  # get '/places', to: "places#get_places"
end
