require 'rails_helper'

describe 'Movies API', types: :request do
  it 'return all moveis' do
    get '/movies'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(3)
   end
end