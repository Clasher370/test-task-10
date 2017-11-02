require 'rails_helper'

describe User do
  %i[posts comments].each do |model|
    it { should have_many(model).dependent(:destroy) }
    it { should have_many(model).with_foreign_key('author_id') }
  end

  %i[nickname email password].each do |attr|
    it { should validate_presence_of(attr) }
  end

  it { should have_secure_password }
end
