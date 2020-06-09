class Trail
  attr_reader :id,
              :location,
              :forecast,
              :trails

  def initialize(location)
    @location = location
  end

  def temperature
    weather_info[:current][:temp].to_i
  end

  def lat_long
    google_info.coordinates(@location)[:results][0][:geometry][:location]
  end

  def weather_info
    WeatherService.new.get_current(lat_long)
  end

  def google_info
    info = GoogleService.new
    info.coordinates(@location)
  end

end
