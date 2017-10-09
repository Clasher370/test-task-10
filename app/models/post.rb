class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates_presence_of :title, :body, :published_at
end
