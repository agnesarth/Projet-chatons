class CartsController < ApplicationController
  before_action :authenticate_user!


  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create
  end

  def show
    @cart = Cart.find(params[:id])
    p @cart.items.length
    p "**************"
  end

  def index
    @carts = Cart.all
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.add_to_cart(item_id)
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
