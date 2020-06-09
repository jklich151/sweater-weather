class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]
    info = GoogleService.new
    info.coordinates(location)
    lat_long = info.coordinates(location)[:results][0][:geometry][:location]
    weather = WeatherService.new.get_current(lat_long)
    temperature = weather[:current][:temp].to_i
    summary = weather[:current][:weather][0][:description]
    lat = lat_long[:lat]
    lon = lat_long[:lng]

    conn = Faraday.get("https://www.hikingproject.com/data/get-trails") do |faraday|
      faraday.params["key"] = ENV['HIKING_KEY']
      faraday.params["lat"] = lat
      faraday.params["lon"] = lon
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
