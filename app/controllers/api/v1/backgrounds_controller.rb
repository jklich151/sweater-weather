class Api::V1::BackgroundsController < ApplicationController
  def index
    background_facade = BackgroundFacade.new
    image = background_facade.image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
