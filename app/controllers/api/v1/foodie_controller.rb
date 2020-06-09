class Api::V1::FoodieController < ApplicationController
  def index
    start = params[:start]
    finish = params[:end]
    search = params[:search]
#services getting data
    direction_data = DirectionsService.new.get_directions(start, finish)
    weather_data = WeatherService.new.new_weather(direction_data)
    restaurant = ZomatoService.new.get_restaurant(direction_data, search)

#poro

    all_food_info = FoodieInfo.new(weather_data, restaurant, direction_data)
    render json: FoodieSerializer.new(all_food_info)
  end
end
