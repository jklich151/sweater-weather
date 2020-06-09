class FoodieInfo
    attr_reader :id,
                :end_location,
                :travel_time,
                :forecast,
                :restaurant


  def initialize(weather_data, restaurant_data, direction_data)
    @id = 'null'
    @end_location = direction_data[:end_location]
    @travel_time = direction_data[:travel_time]
    @forecast = final_forecast(@temperature, @summary)
    @restaurant = final_restaurant(@name, @address)
    @summary = weather_data[:current][:weather][0][:description]
    @temperature = weather_data[:current][:temp]
    @name = restaurant_data[:restaurants][0][:restaurant][:name]
    @address = restaurant_data[:restaurants][0][:restaurant][:location][:address]
  end

  def final_forecast(temperature, summary)
    new_hash = {}
    new_hash[:temperature] = temperature
    new_hash[:summary] = summary
    new_hash
  end

  def final_restaurant(name, address)
    new_hash = {}
    new_hash[:name] = name
    new_hash[:address] = address
    new_hash
  end
end
# data": {
# #     "id": "null",
# #     "type": "foodie",
# #     "attributes": {
# #       "end_location": "pueblo,co",
# #       "travel_time": "1 hours 48 min",
# #       "forecast": {
# #         "summary": "Cloudy with a chance of meatballs",
# #         "temperature": "83"
# #       },
# #       "restaurant": {
# #         "name": "Angelo's Pizza Parlor",
# #         "address": "105 E Riverwalk, Pueblo 81003"
# #       }
