class DirectionsFacade

  def directions(origin, destination)
    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_KEY']
    end

    response = conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")

    json = JSON.parse(response.body, symbolize_names: true)
    travel_info = json[:routes][0][:legs][0]
    Direction.new(travel_info)
  end
end
