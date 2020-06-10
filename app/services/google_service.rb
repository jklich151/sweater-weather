class GoogleService

  def coordinates(location)
    response = conn.get("/maps/api/geocode/json?address=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def arrival_time(origin, destination)
    response = conn_2.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_KEY"]
    end
  end

  def conn_2
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_DIRECTIONS_KEY"]
    end
  end
end
