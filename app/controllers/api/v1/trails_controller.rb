class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]
    trails = Trail.new(location)
  require "pry"; binding.pry
    # info = GoogleService.new
    # info.coordinates(location)
    # lat_long = info.coordinates(location)[:results][0][:geometry][:location]
    # weather = WeatherService.new.get_current(lat_long)
    # temperature = weather[:current][:temp].to_i
    # summary = weather[:current][:weather][0][:description]
    # lat = lat_long[:lat]
    # lon = lat_long[:lng]

    # json = HikingService.new(lat, lon).hiking_info
    #
    # trails = json[:trails].map do |trail|
    #
    # distance_to_trail = MapquestService.new(location, trail[:location]).get_distance
    #
    #   {name: trail[:name], summary: trail[:summary], difficulty: trail[:difficulty], location: trail[:location], distance_to_trail: distance_to_trail }
    #
    # end
  end
end
