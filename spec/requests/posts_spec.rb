require 'rails_helper'

describe 'Posts' do
  let(:valid_attr) do
    user = create(:user)
    attributes_for(:post, author_id: user.id)
  end

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

      %w[id title body published_at author_nickname].each do |attr|
        it "is have #{attr} attribute" do
          expect(JSON.parse(response.body)[attr]).not_to be_nil
        end
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

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'is return post by id' do
      get "/api/v1/posts/#{post.id}"
      expect(JSON.parse(response.body)['id']).to eq post.id
    end

    it 'is return error if wrong id' do
      wrong_id = post.id - 1
      get "/api/v1/posts/#{wrong_id}"
      expect(JSON.parse(response.body)).to eq "error" => "Couldn't find Post with 'id'=#{wrong_id}"
    end
  end

  describe 'GET #index' do
    let!(:user) { create(:user_with_twenty_posts) }
    let!(:post) { create(:post, author: user, published_at: Time.now + 1.hour) }

    context 'with correct params' do
      before { get '/api/v1/posts', params: { page: 1, per_page: 2 } }

      it { expect(response).to have_http_status 200 }

      it 'return list of posts 2 by page' do
        expect(JSON.parse(response.body).count).to eq 2
      end

      it 'is ordered by published_at DESC' do
        expect(JSON.parse(response.body)[0]['id']).to eq post.id
      end

      it 'is last page have 1 post' do
        get '/api/v1/posts', params: { page: 11, per_page: 2 }
        expect(JSON.parse(response.body).count).to eq 1
      end

      context 'response have headers' do
        it 'pages-count' do
          expect(response['pages-count']).to eq '11'
        end

        it 'posts-count' do
          expect(response['posts-count']).to eq '21'
        end
      end
    end

    context 'without params' do
      before { get '/api/v1/posts' }

      it { expect(JSON.parse(response.body).count).to eq 21 }

      it 'pages-count return none' do
        expect(response['pages-count']).to eq 'none'
      end
    end

    context 'with only' do
      context 'invalid page param' do
        before { get '/api/v1/posts', params: { page: 2 }}

        it { expect(JSON.parse(response.body)).to be_empty }
        it { expect(response['pages-count']).to eq 'none' }
      end

      context 'per_page param' do
        before { get '/api/v1/posts', params: { per_page: 5 }}

        it { expect(JSON.parse(response.body).count).to eq 5 }
        it { expect(response['pages-count']).to eq '5' }
      end
    end
  end
end
