class OrdersController < ApplicationController

  def create

    @cart.current_cart


  end

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

  def current_cart
    if current_user.cart.present?
      current_cart = Cart.find_by_user_id(current_user.id)
    else
      current_cart = Cart.create(user: current_user)
      session[:cart_id] = current_cart.id
      current_cart
    end
  end

end
