class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]
    search = params[:search]

    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_KEY']
    end

    response = conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")

    json = JSON.parse(response.body, symbolize_names: true)

    travel_info = json[:routes][0][:legs][0]
    # travel_time = [:duration][:text]
    # location = [:end_address]
    lat = json[:routes][0][:legs][0][:end_location][:lat]
    lng = json[:routes][0][:legs][0][:end_location][:lng]

    #open weather
    conn_2 = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['OPEN_WEATHER_KEY']
    end

    response_2 = conn_2.get("/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial")

    json_2 = JSON.parse(response_2.body, symbolize_names: true)

    forecast = json_2
    # json_2[:main][:temp]
    # json_2[:weather][0][:description]
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
