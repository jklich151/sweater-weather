class HikingService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def hiking_info
    JSON.parse(conn.body, symbolize_names: true)
  end

  def conn
    Faraday.get("https://www.hikingproject.com/data/get-trails") do |faraday|
      faraday.params["key"] = ENV['HIKING_KEY']
      faraday.params["lat"] = @lat
      faraday.params["lon"] = @lon
    end
  end
end
