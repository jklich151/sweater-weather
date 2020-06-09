require 'rails_helper'

RSpec.describe 'API V1', type: :request do
  it 'get api/v1/trails' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
  end
end
# "data": {
#    "id": "null",
#    "type": "trail",
#    "attributes": {
#      "location": "denver,co",
#      "forecast": {
#        "summary": "Cloudy with a chance of meatballs",
#        "temperature": "83"
#      },
#      "trails": [
#        {
#          "name": "Boulder Skyline Traverse",
#          "summary": "The classic long mountain route in Boulder."
#          "difficulty": "black"
#          "location": "Superior, Colorado"
#          "distance_to_trail": "23.008"
#        },
#        {
#          "name": "Bear Peak Out and Back",
#          "summary": "A must-do hike for Boulder locals and visitors alike!"
#          "difficulty": "black"
#          "location": "Boulder, Colorado"
#          "distance_to_trail": "30.098"
#        },
#        {...}
#      ]
