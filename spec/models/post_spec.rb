require 'rails_helper'

describe Post do
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments) }

  %i[title body published_at].each do |attr|
    it { should validate_presence_of(attr) }
  end
end
