class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { data: "Bad Credentials" }, status: 400
    end
  end
end
