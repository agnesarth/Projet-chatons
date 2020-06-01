class UsersController < ApplicationController
  after_create :welcome_send

  def new
  end

  def create
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

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
