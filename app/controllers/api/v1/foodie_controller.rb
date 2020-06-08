class Api::V1::FoodieController < ApplicationController
  def show
    origin = params[:start]
    destination = params[:end]

    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_MAPS_KEY']
    end

    response = conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}")

  end
end
