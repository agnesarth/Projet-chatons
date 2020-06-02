class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order)
  end

end
