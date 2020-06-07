require 'rails_helper'

RSpec.describe 'API V1 ', type: 'request' do
  it 'get api/v1/backgrounds' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).not_to be_empty
  end
end
