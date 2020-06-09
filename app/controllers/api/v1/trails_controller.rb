class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]
    info = GoogleService.new
    info.coordinates(location)
    lat_long = info.coordinates(location)[:results][0][:geometry][:location]
    weather = WeatherService.new.get_current(lat_long)
    temperature = weather[:current][:temp].to_i
    summary = weather[:current][:weather][0][:description]

    conn = Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.headers[""] = '<YOUR API KEY>'
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

  end
end
