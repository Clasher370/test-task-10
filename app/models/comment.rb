class Comment < ApplicationRecord
  include TimeSetter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  before_create :set_published_at

  validates_presence_of :body
end
