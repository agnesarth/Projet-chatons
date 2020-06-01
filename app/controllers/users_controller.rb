class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
  end

  def index
      @users = User.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
