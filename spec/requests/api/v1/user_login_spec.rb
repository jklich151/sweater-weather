require 'rails_helper'

RSpec.describe 'API V1 ', type: 'request' do
  before :each do
    User.destroy_all
    User.create(email: "example@email.com",
            password: "password",
            password_confirmation: "password" )
  end
  it 'post api/v1/sessions successful' do
    params = {email: "example@email.com", password: "password"}

    post '/api/v1/sessions', params: params

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes]).to have_key(:email)
  end

  it 'post /api/v1/sessions unsucessful password' do
    params = {email: "example@email.com", password: "wrong password"}

    post '/api/v1/sessions', params: params

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to eq("Bad Credentials")
  end

  it 'post /api/v1/sessions unsucessful email' do
    params = {email: "wrong@email.com", password: "password"}

    post '/api/v1/sessions', params: params

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to eq("Bad Credentials")
  end
end
