class DirectionsFacade

  def directions(origin, destination)
    travel_info = MapService.new.get_directions(origin, destination)
    Direction.new(travel_info)
  end
end
