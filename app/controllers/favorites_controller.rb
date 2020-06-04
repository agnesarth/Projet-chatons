class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @user = current_user
    @favorite = Favorite.create
    puts "----------------------"
    puts @favorite
    puts @favorite.user_id
    puts @favorite.item_id
    puts "-----------------------"
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def index
    @favorites = Favorite.all
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :item_id)
  end
end
