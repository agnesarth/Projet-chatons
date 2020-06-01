class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order)
  end

end
