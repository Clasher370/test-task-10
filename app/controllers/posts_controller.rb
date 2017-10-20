class PostsController < ApplicationController
  after_action :set_headers, only: :index

  def index
    post = Post.all.order('published_at DESC').paginate(page: params[:page], per_page: params[:per_page])
    render json: post, status: :ok
  end

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

  def set_headers
    post_size = Post.all.count
    pages_count = params[:per_page] ? (post_size / params[:per_page].to_i).to_s : 'none'

    response.set_header('pages-count', pages_count)
    response.set_header('posts-count', post_size.to_s)
  end

  def post_params
    params.permit(:title, :body, :published_at, :author_id)
  end
end
