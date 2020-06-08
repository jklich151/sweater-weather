class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    search = params[:search]

    directions_facade = DirectionsFacade.new(origin, destination)
    travel_info = directions_facade.directions
    render json: TravelSerializer.new(travel_info)

    lat = directions_facade.lat
    lng = directions_facade.lng

    #open weather

    destination_weather_facade = DestinationWeatherFacade.new
    forecast = destination_weather_facade.destination_results(lat, lng)
    render json: ForecastSerializer.new(forecast)

    #zomato
    food_facade = FoodFacade.new
    restaurant = food_facade.restaurant(lat, lng, search)
    render json: FoodSerializer.new(restaurant)
  end
end
