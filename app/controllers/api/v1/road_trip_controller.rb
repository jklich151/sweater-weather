class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params[:origin]
    destination = params[:destination]
    map_info = GoogleService.new.arrival_time(origin, destination)
    results = map_info[:routes][0][:legs][0][:end_location]
    weather = WeatherService.new.current_weather(results)

    user = User.find_by(api_key: params[:api_key])
    if user
      trip_results = RoadTrip.new(origin, destination, weather)
      render json: RoadTripSerializer.new(trip_results)
    else
      render json: {message: 'Unauthorized Key'}, status: :unauthorized
    end
  end
end
