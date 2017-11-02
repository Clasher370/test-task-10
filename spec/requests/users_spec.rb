require 'rails_helper'

describe 'Users' do
  let(:valid_attr) { attributes_for(:user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      before { post '/api/v1/user_create', params: valid_attr }

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'return success message' do
        expect(response.body).to match /Created successfully!/
      end
    end

    context 'with invalid attributes' do
      before { post '/api/v1/user_create', params: {} }

      it 'returns http unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'is have errors messages' do
        expect(response.body).to match /can't be blank/
      end
    end
  end
end
