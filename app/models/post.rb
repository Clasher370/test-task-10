class Post < ApplicationRecord
  include TimeSetter

  belongs_to :author, class_name: 'User'
  has_many :comments

  validates_presence_of :title, :body

  before_create :set_published_at

  def author_nickname
    author.nickname
  end
end
