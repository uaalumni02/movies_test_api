require 'rails_helper'

describe 'Movies API', types: :request do
  it 'return all moveis' do
    FactoryBot.create(:movie, name: 'Coming to America' )
    FactoryBot.create(:movie, name: 'Boyz in the Hood' )

    get '/movies'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
   end
end