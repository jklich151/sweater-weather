require 'rails_helper'

RSpec.describe 'API V1', type: :request do
  before :each do
    User.destroy_all
    User.create(email: "example@email.com",
            password: "password",
            password_confirmation: "password" )
  end
  it 'post api/v1/road_trip successful' do
    params = {email: "example@email.com", password: "password"}

    post '/api/v1/sessions', params: params

    api_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'

    post '/api/v1/road_trip', params: { origin: origin,
                                        destination: destination,
                                        api_key: api_key
                                      }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(json[:origin]).to eq("Denver,CO")
    expect(json[:destination]).to eq("Pueblo,CO")
    expect(json[:travel_time]).to_not be_empty
    expect(json[:current_temp].class).to be(Float)
    expect(json[:summary]).to_not be_empty
  end

  it 'post api/v1/road_trip unsuccessful' do
    params = {email: "example@email.com", password: "password"}

    post '/api/v1/sessions', params: params

    api_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'

    post '/api/v1/road_trip', params: { origin: origin,
                                        destination: destination,
                                        api_key: "#{api_key}x7n5r"
                                      }

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:message]).to eq('Unauthorized Key')
  end
end
