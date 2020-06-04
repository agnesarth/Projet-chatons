class ChargesController < ApplicationController
    def new
    end

    def create
        @cart = Cart.find(current_cart.id)
        @user = User.find(current_user.id)
        @amount = (@cart.total_price * 100).to_i
    
        @customer = Stripe::Customer.create({
          email: params[:stripeEmail],
          source: params[:stripeToken],
        })
    
        @charge = Stripe::Charge.create({
          customer: @customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'eur',
        })

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to root_path
        
    end
end