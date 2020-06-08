class DestinationWeather
  attr_reader :summary,
              :temperature

  def initialize(forecast)
    @summary = forecast[:weather][0][:description]
    @temperature = forecast[:main][:temp]
  end
end
