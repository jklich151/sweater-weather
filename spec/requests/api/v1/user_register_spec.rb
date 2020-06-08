# require 'rails_helper'
#
# RSpec.describe 'API V1 ', type: 'request' do
#   it 'post api/v1/users successful' do
#     user = {email: "example@email.com",
#           password: "password",
#           password_confirmation: "password"}
#
#     post '/api/v1/users', params: user
#
#     expect(response).to be_successful
#
#     json = JSON.parse(response.body, symbolize_names: true)
#
#     expect(json[:data][:attributes]).to have_key(:api_key)
#   end
# end
