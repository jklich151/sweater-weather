class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    search = params[:search]

    directions_facade = DirectionsFacade.new(origin, destination, search)
    render json: FoodSerializer.new(directions_facade)
  end
end

  # "data": {
  #   "id": "null",
  #   "type": "foodie",
  #   "attributes": {
  #     "end_location": "pueblo,co",
  #     "travel_time": "1 hours 48 min",
  #     "forecast": {
  #       "summary": "Cloudy with a chance of meatballs",
  #       "temperature": "83"
  #     },
  #     "restaurant": {
  #       "name": "Angelo's Pizza Parlor",
  #       "address": "105 E Riverwalk, Pueblo 81003"
  #     }
  #   }
  # }
