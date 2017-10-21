require 'rails_helper'

describe 'Authenticate' do
  let(:user) { create(:user) }
  let!(:token) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  context 'auth token' do
    before { post '/user_token', params: {"auth": {"email": user.email, "password": "secret"}} }

    it { expect(response).to have_http_status 201 }

    it 'return token' do
      expect(JSON.parse(response.body)['jwt']).to eq token
    end
  end

  context 'auth to secured resource' do
    let(:header) do
      {
          'Authorization': "Bearer #{token}"
      }
    end

    before { get '/api/v1/posts', headers: header }

    it { expect(response).to have_http_status 200 }
  end
end
