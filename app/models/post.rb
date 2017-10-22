class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates_presence_of :title, :body

  before_create :set_published_at

  def author_nickname
    author.nickname
  end

  private

  def set_published_at
    self.published_at = Time.now unless self.published_at
  end
end
