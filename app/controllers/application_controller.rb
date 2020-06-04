class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_cart
    if current_user.cart.present?
      current_cart = current_user.cart
    else
      current_cart = Cart.create(user: current_user)
      session[:cart_id] = current_cart.id
      current_cart
    end
  end

  def current_wishlist
    if current_user.wishlist.present?
      current_wishlist = current_user.wishlist
    else
      current_wishlist = Wishlist.create(user: current_user)
      session[:wishlist_id] = current_wishlist.id
      current_wishlist
    end
  end


end
