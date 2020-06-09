# require 'rails_helper'
#
# RSpec.describe 'API V1 ', type: 'request' do
#   before :each do
#     User.destroy_all
#   end
#   it 'post api/v1/sessions successful' do
#     user = {email: "example@email.com",
#             password: "password",
#             password_confirmation: "password"}
#
#     post '/api/v1/users', params: user
#
#     params = {email: "example@email.com", password: "password"}
#
#     post '/api/v1/sessions', params: params
#
#     expect(response).to be_successful
#
#     json = JSON.parse(response.body, symbolize_names: true)
#
#     # expect(json[:data][:attributes]).to have_key(:api_key)
#   end
# end
