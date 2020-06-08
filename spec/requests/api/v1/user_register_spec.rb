require 'rails_helper'

RSpec.describe 'API V1 ', type: 'request' do
  before :each do
    User.destroy_all
  end
  it 'post api/v1/users successful' do
    user = {email: "example@email.com",
          password: "password",
          password_confirmation: "password"}

    post '/api/v1/users', params: user

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
  end

  it 'post api/v1/users not successful' do
    user = {email: "example@email.com",
          password: "password",
          password_confirmation: "wrong password"}

    post '/api/v1/users', params: user

    expect(response).to_not be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[0]).to eq("Password confirmation doesn't match Password")
  end
end
