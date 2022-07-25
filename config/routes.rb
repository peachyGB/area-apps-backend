Rails.application.routes.draw do
  
  resources :places
  resources :interactions
  resources :businesses
  resources :users
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  #API fetching
  # get '/places', to: "places#get_places"
end
