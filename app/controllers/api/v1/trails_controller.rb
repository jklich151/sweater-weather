class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]
    trails = Trail.new(location)
  end
end
