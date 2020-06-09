class Trail
  attr_reader :id,
              :location,
              :forecast,
              :trails

  def initialize(location)
    @location = location
  end

  def lat
    lat_long[:lat]
  end

  def lon
    lat_long[:lng]
  end

  def summary
    weather_info[:current][:weather][0][:description]
  end

  def temperature
    weather_info[:current][:temp].to_i
  end

  def lat_long
    google_info[:results][0][:geometry][:location]
  end

  def trails
    hiking_info[:trails].map do |trail|
    distance_to_trail = MapquestService.new(@location, trail[:location]).get_distance
      {name: trail[:name], summary: trail[:summary], difficulty: trail[:difficulty], location: trail[:location], distance_to_trail: distance_to_trail }
    end
  end

  def hiking_info
    HikingService.new(lat, lon).hiking_info
  end

  def weather_info
    WeatherService.new.get_current(lat_long)
  end

  def google_info
    info = GoogleService.new
    info.coordinates(@location)
  end

end
