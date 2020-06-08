class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    search = params[:search]

    directions_facade = DirectionsFacade.new
    travel_info = directions_facade.directions(origin, destination)

    lat = travel_info[:end_location][:lat]
    lng = travel_info[:end_location][:lng]

    #open weather

    destination_weather_facade = DestinationWeatherFacade.new
    forecast = destination_weather_facade.destination_results(lat, lng)

    #zomato
    food_facade = FoodFacade.new
    restaurant = food_facade.restaurant(lat, lng, search)
  end
end
