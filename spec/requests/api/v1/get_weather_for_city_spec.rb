require 'rails_helper'

RSpec.describe 'API V1 ', type: 'request' do
  it 'get api/v1/forecast' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:current_weather]).not_to be_empty
  end
end
