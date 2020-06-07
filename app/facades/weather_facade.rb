class WeatherFacade

  def forecast(results)
    weather_info = WeatherService.new.all_weather_info(results)
    Weather.new(weather_info)
  end
end
