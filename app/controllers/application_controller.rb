class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    if session[:user_id]
      current_user = User.find(session[:user_id])
    end
  end

  def current_cart
    if !session[:cart_id].nil?
      current_cart = Cart.find(session[:cart_id])
    else
      current_cart = Cart.new
    end
  end

end
