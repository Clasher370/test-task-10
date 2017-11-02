require 'rails_helper'

describe 'Reports' do
  before do
    post '/api/v1/reports/by_author',
         params: { start_date: start_date,
                   end_date: end_date,
                   email: test_mail },
         headers: authenticated_header
  end

  it 'is return ok status' do
    expect(response).to have_http_status 200
  end

  it 'body have message' do
    expect(JSON.parse(response.body)['message']).
        to eq 'Report generation started'
  end
end
