class DestinationWeatherFacade

  def destination_results(lat, lng)
    json = OpenService.new.get_forecast(lat, lng)
    DestinationWeather.new(forecast)
  end
end
