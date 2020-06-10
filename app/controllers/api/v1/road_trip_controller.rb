class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params[:origin]
    destination = params[:destination]
    api_key = params[:api_key]

    map_info = GoogleService.new.arrival_time(origin, destination)
    results = map_info[:routes][0][:legs][0][:end_location]
    weather = WeatherService.new.current_weather(results)
    trip_results = RoadTrip.new(origin, destination, weather)

    render json: RoadTripSerializer.new(trip_results)
  end
end
