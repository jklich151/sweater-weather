class MapService

  def get_directions(origin, destination)
    response = conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")

    JSON.parse(response.body, symbolize_names: true)[:routes][0][:legs][0]
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_KEY']
    end
  end
end
