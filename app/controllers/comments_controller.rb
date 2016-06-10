class CommentsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_comment, only: [:edit, :update]
  def index
  end

  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comment.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post
    else
      render :edit
    end
  end

  def show
  end

  def edit
    @post = Post.find(params[:post_id])
    redirect_to root_path unless @comment.user == current_user
  end

  def destroy
  end

private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
