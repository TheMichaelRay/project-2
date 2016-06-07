class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title)
  end
end
