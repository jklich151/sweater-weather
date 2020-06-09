require 'rails_helper'

RSpec.describe 'API V1', type: :request do
  it 'get api/v1/trails' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
    expect(json[:data][:attributes][:location]).to eq("denver,co")
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:trails]).to be_a(Array)
    expect(json[:data][:attributes][:trails][0]).to have_key(:name)
    expect(json[:data][:attributes][:trails][0]).to have_key(:summary)
    expect(json[:data][:attributes][:trails][0]).to have_key(:difficulty)
    expect(json[:data][:attributes][:trails][0]).to have_key(:location)
    expect(json[:data][:attributes][:trails][0]).to have_key(:distance_to_trail)
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
