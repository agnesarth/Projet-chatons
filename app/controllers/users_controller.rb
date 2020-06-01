class UsersController < ApplicationController
  after_create :welcome_send

  def new
    @user = User.new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def index
      @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
