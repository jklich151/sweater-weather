class OpenService
  def get_forecast(lat, lng)
    response = conn.get("/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial")

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['OPEN_WEATHER_KEY']
    end
  end
end
