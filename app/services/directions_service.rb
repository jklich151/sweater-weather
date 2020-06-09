class DirectionsService

  def get_directions(start, finish)
    response = conn.get("/maps/api/directions/json?origin=#{start}&destination=#{finish}")
    json = JSON.parse(response.body, symbolize_names: true)

    travel_time = json[:routes][0][:legs][0][:duration][:text]
    end_location = json[:routes][0][:legs][0][:end_address]
    lat_long = json[:routes][0][:legs][0][:end_location]
    data = lat_long.merge(end_location: end_location)
    data.merge(travel_time: travel_time)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_KEY']
    end
  end
end
