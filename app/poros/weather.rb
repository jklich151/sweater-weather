class Weather
  attr_reader :id,
              :current_weather,
              :hourly,
              :future_daily_forecast

  def initialize(results)
    @current_weather = results[:current]
    @hourly = results[:hourly]
    @future_daily_forecast = results[:daily]
  end
end
