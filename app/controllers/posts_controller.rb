class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: [post.errors.messages] }, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post, status: :ok
  rescue => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def post_params
    params.permit(:title, :body, :published_at, :author_id)
  end
end
