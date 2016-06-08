class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :update, :edit]

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
    redirect_to root_path unless @post.user == current_user
  end

  def update
    if @post.update(edit_post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy if @post.user == current_user
    redirect_to root_path
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def edit_post_params
    params.require(:post).permit(:body)
  end
end
