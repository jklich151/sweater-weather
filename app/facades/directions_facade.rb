class DirectionsFacade

  def directions(origin, destination)
    travel_info = MapService.new.(origin, destination)
    Direction.new(travel_info)
  end
end
