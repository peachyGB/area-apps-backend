class PlacesController < ApplicationController
   
    require 'rest-client'
    require_relative '../../.keygoo.rb'
    require_relative '../../.keyptv.rb'
    require_relative '../../.keyser.rb'

    # def index
    #     render json: {"Please search by zip code"}
    # end

        #GET /places/:zip
    def retrieve
        url = "https://api.myptv.com/geocoding/v1/locations/by-text?searchText=#{params[:zip]}&countryFilter=US&apiKey=#{$ptv_api_key}"
        ptvResponse = RestClient.get(url)
        locationInfo = JSON.parse(ptvResponse.body)
        lat = locationInfo["locations"][0]["referencePosition"]["latitude"]
        lon = locationInfo["locations"][0]["referencePosition"]["longitude"]
        puts lat
        puts lon

        googleUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat}%2C#{lon}&radius=#{params[:radius]}&type=#{params[:category]}&key=#{$goo_api_key}"
        googleResponse = RestClient.get(googleUrl)
        googleInfo = JSON.parse(googleResponse.body)
        businessNames = []
        googleInfo["results"].each do |item|
            businessNames << item["name"]
        end
        puts businessNames 

        uniqueBizNames = businessNames.uniq
        puts uniqueBizNames

        names_limiter = uniqueBizNames.slice(1,12)
        puts names_limiter

        search_results = []
        names_limiter.each do |name|
            search_results << JSON.parse(RestClient.get("https://serpapi.com/search.json?engine=google_play&q=#{name.parameterize}&store=apps&hl=en&gl=us&api_key=#{$ser_api_key}"))
        end
        render json: search_results 
    end


end

