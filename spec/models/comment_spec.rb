require 'rails_helper'

describe Comment do
  it { should belong_to(:author).class_name('User') }
  it { should belong_to(:post) }
  it { should validate_presence_of(:body) }

  context '#set_published_at' do
    let(:comment) { create(:comment, published_at: nil) }

    it 'set published_at attr' do
      expect(comment.published_at).not_to be_nil
    end
  end
end
