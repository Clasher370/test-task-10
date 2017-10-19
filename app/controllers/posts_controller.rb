class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: [post.errors.messages] }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :body, :published_at, :author_id)
  end
end
