class Api::V1::ForecastController < ApplicationController
  def index
    geocode_facade = GeocodeFacade.new
    results = geocode_facade.coords(params[:location])

    weather_facade = WeatherFacade.new
    weather_info = weather_facade.forecast(results)
    render json: WeatherSerializer.new(weather_info)
  end
end
