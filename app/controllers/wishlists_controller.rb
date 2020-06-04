class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.create
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def index
    @wishlists = Wishlist.all
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  def update
    @wishlist = Wishlist.find(params[:id])
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
  end

  private

  def wishlist_params
    params.require(:wishlist)
  end
end
