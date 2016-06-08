class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
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
    if @user.update(edit_user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation, :avatar)
  end

  def edit_user_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end

end
