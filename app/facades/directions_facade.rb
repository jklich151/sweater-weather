class DirectionsFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
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
end
