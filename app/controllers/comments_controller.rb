class CommentsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]

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
  end

  def show
  end

  def edit
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

  def edit_comment_params
    params.require(:comment).permit(:body)
  end
end
