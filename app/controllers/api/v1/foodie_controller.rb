class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    search = params[:search]

    directions_facade = DirectionsFacade.new
    travel_info = directions_facade.directions(origin, destination)

    lat = travel_info[:end_location][:lat]
    lng = travel_info[:end_location][:lng]

    #open weather

    destination_weather_facade = DestinationWeatherFacade.new
    forecast = destination_weather_facade.destination_results(lat, lng)
    
    #zomato

    conn_3 = Faraday.new(url: "https://developers.zomato.com") do |faraday|
      faraday.headers["user-key"] = ENV['ZOMATO_KEY']
    end

    response_3 = conn_3.get("/api/v2.1/search?lat=#{lat}&lon=#{lng}&q=#{search}")

    json_3 = JSON.parse(response_3.body, symbolize_names: true)

    restaurant = json_3[:restaurants][0][:restaurant]

    # name = json_3[:restaurants][0][:restaurant][:name]
    # address = json_3[:restaurants][0][:restaurant][:location][:address]
  end
end
