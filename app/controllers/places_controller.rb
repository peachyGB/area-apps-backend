class PlacesController < ApplicationController
   
    require 'rest-client'
    require_relative '../../.keygoo.rb'
    require_relative '../../.keyptv.rb'
    require_relative '../../.keyser.rb'

    # def index
    #     render json: {"Please search by zip code"}
    # end

        #GET /places/:id
    def show
        url = "https://api.myptv.com/geocoding/v1/locations/by-text?searchText=#{params[:id]}&countryFilter=US&apiKey=#{$ptv_api_key}"
        ptvResponse = RestClient.get(url)
        locationInfo = JSON.parse(ptvResponse.body)
        lat = locationInfo["locations"][0]["referencePosition"]["latitude"]
        lon = locationInfo["locations"][0]["referencePosition"]["longitude"]

        googleUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat}%2C#{lon}&radius=800&key=#{$goo_api_key}"
        googleResponse = RestClient.get(googleUrl)
        googleInfo = JSON.parse(googleResponse.body)
        businessNames = []
        googleInfo["results"].each do |item|
            businessNames << item["name"]
        end
        names_limiter = businessNames.slice(1,2)
        # render json: googleResponse
        

        search_results = []
        names_limiter.each do |name|
            search_results << JSON.parse(RestClient.get("https://serpapi.com/search.json?engine=google_play&q=#{name.delete(' ')}&store=apps&hl=en&gl=us&api_key=#{$ser_api_key}"))
        end
        render json: search_results
    end


end
# if results includes "game", skip the result
# if ser API --> "organic results">"title":>"Recommended for you", return none found
# cuztomizable radius?

# &keyword=restaurant <-- not relegated to a set of words 
# Categories: All, food(restaurant), retail (department_store, store), hotels(lodging), bank(bank)