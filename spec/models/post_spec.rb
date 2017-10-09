require 'rails_helper'

describe Post do
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:published_at) }
end
