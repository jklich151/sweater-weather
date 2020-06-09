class WeatherService

  def all_weather_info(results)
    response = conn.get("/data/2.5/onecall?lat=#{results.lat}&lon=#{results.lng}&units=imperial")

    JSON.parse(response.body, symbolize_names: true)
  end

  def new_weather(direction_data)
    response = conn.get("/data/2.5/onecall?lat=#{direction_data[:lat]}&lon=#{direction_data[:lng]}&units=imperial")

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV["OPEN_WEATHER_KEY"]
    end
  end
end
