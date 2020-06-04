class PhotosController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(photo_params)
    session[:item_id] = @item.id
    @item.photo.attach(params[:photo])
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:item).permit(:title, :price, :image_url, :description, :photo)
  end

end
