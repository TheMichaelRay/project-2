class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authorize, only: [:new, :update, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
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
    params.require(:post).permit(:title, :body)
  end
end
