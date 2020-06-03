class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new()
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @user= current_user
    @user.orders = Order.all
  end

  private

  def order_params
    params.require(:order)
  end

end
