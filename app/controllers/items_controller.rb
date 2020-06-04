class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.find(params[:id])
    @cart = current_cart
    if @cart.items.include?(@item)
      flash[:error] = "Alert! Animal trafficking! Cat already in the cart, no more of this breed allowed"
    end
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

end
