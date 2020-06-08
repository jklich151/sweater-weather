class DestinationWeatherFacade

  def destination_results(lat, lng)
    conn_2 = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['OPEN_WEATHER_KEY']
    end

    response_2 = conn_2.get("/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial")

    forecast = JSON.parse(response_2.body, symbolize_names: true)

    DestinationWeather.new(forecast)
  end
end
