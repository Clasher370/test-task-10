require 'rails_helper'

describe User do
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:comments).with_foreign_key('author_id') }

  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:posts).with_foreign_key('author_id') }

  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it { should have_secure_password }
end
