require 'rails_helper'

describe 'Posts' do
  let(:user) { create(:user) }
  let(:valid_attr) { attributes_for(:post, author_id: user.id) }

  context 'factory is valid' do
    it 'build' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'create' do
      post = create(:post)
      expect(post.errors.messages).to be_empty
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before { post '/api/v1/posts', params: valid_attr }

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'return success message' do
        expect(response.body).to match /Created successfully!/
      end
    end

    context 'with invalid attributes' do
      before { post '/api/v1/posts', params: {} }

      it 'returns http unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'is have errors messages' do
        expect(response.body).to match /can't be blank/
      end
    end
  end
end
