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

    json = HikingService.new(lat, lon).hiking_info

    trails = json[:trails].map do |trail|
      conn = Faraday.get("http://www.mapquestapi.com/directions/v2/route") do |faraday|
        faraday.params["key"] = ENV['MAPQUEST_KEY']
        faraday.params["from"] = params[:location]
        faraday.params["to"] = trail[:location]
      end
      json = JSON.parse(conn.body, symbolize_names: true)
      distance_to_trail = json[:route][:distance]

      {name: trail[:name], summary: trail[:summary], difficulty: trail[:difficulty], location: trail[:location], distance_to_trail: distance_to_trail }

    end
  end
end
