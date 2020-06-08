require 'rails_helper'

RSpec.describe 'API V1', type: 'request' do
  it 'get api/v1/foodie' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
  end
end
