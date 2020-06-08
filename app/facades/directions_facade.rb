class DirectionsFacade
  attr_reader :id

  def initialize(origin, destination, search)
    @origin = origin
    @destination = destination
    @search = search
    @id = nil
  end

  def travel_info
    MapService.new.get_directions(@origin, @destination)
  end

  def directions
    Direction.new(travel_info)
  end

  def lat
    travel_info[:end_location][:lat]
  end

  def lng
    travel_info[:end_location][:lng]
  end

  def forecast
    destination_weather_facade = DestinationWeatherFacade.new
    destination_weather_facade.destination_results(lat, lng)
  end

  def restaurant
    food_facade = FoodFacade.new
    food_facade.restaurant(lat, lng, @search)
  end

  def end_location
    travel_info[:end_address]
  end

  def travel_time
    travel_info[:duration][:text]
  end

  def summary
    forecast.summary
  end

  def temperature
    forecast.temperature
  end

  def name
    restaurant.name
  end

  def address
    restaurant.address
  end
end
