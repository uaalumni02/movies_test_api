require 'rails_helper'

describe 'Movies API', types: :request do
    describe 'GET /movies' do
  it 'return all moveis' do
    FactoryBot.create(:movie, name: 'Coming to America' )
    FactoryBot.create(:movie, name: 'Boyz in the Hood' )

    get '/movies'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /movies' do
      it 'creates a new movie'do
      expect {
      post '/movies', params: {movie: {name: 'Best Man'}}
      }.to change { Movie.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end
  describe 'DELETE /movies/:id' do
      it 'deletes a movie' do
        FactoryBot.create(:movie, name: 'Coming to America' )

          delete '/movies/1'

          expect(response).to have_http_status(:no_content)
      end
  end
end