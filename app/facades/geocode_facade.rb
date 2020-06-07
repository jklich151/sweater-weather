class GeocodeFacade

  def coords(location)
    json = GoogleService.new.coordinates(location)
    results = json[:results][0][:geometry][:location]
    Forecast.new(results)
  end
end
