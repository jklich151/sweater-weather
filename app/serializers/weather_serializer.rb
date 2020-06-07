class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather, :hourly, :future_daily_forecast
end
