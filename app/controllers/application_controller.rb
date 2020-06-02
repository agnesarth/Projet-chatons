class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #private

  #def current_cart
      #Cart.find(session[:cart_id], user: current_user)
    #rescue ActiveRecord::RecordNotFound
      #cart = Cart.create(user: current_user)
      #session[:cart_id] = cart.id
      #cart
#  end


end
