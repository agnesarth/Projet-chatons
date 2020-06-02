class ItemsController < ApplicationController
  #before_action :current_cart, only: [:create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.find(params[:id])
    @cart = current_cart
    @cart.add_to_cart(params[:id])
    redirect_to cart_path(@cart.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @cart = current_cart
    @cart.items.destroy(params[:id])
    redirect_to cart_path(@cart.id)
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image_url, :description)
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
