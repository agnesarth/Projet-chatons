class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart

  def new
    @cart = Cart.new
  end

  def create
    @cart = current_cart
    @cart.user = current_user
    p @cart
    @cart.add_to_cart(id)
    redirect_to cart_path(@cart.id)
  end

  def show
    @cart = Cart.find(params[:id])
  end

  #def index
    #@carts = Cart.all
  #end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    p @cart
    @cart.add_to_cart(item_id)
    p @cart
    redirect_to cart_path(@cart.id)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  private

  def cart_params
    params.require(:cart)
  end

end
