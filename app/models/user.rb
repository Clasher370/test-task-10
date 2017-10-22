class User < ApplicationRecord
  has_secure_password

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  validates_presence_of :nickname, :email, :password_digest
end
