require 'rails_helper'

describe Post do
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments) }

  %i[title body].each do |attr|
    it { should validate_presence_of(attr) }
  end

  context '#author_nickname' do
    let(:post) { create(:post) }
    it 'return user nickname' do
      expect(post.author_nickname).to eq post.author.nickname
    end
  end

  context '#set_published_at' do
    let(:post) { create(:post, published_at: nil) }

    it 'set published_at attr' do
      expect(post.published_at).not_to be_nil
    end
  end
end
