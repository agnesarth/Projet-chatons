class OrdersController < ApplicationController
  before_action :authenticate_user!

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
    
    @order = Order.new(user: @user)
    @cart.items.each do |item|
      @order.add_to_order(item.id)
    end

    if @order.save
      @cart.destroy
      flash[:success] = "Commande enregistrée."
      redirect_to root_path
    else
      message = []
      if @cart.errors.any?
        @cart.errors.full_message.each do |message|
          messages << message
        end
      flash[:error] = messages
      redirect_to root_path
      end
    end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path

  end

  def show
    @user = current_user
    @order= Order.find(params[:id])
    respond_to do |format|
      format.html { redirect_to user_order_path }
      format.js { }
    end
  end

  def index
    @user= current_user
    @user.orders = Order.all
  end

  private

  def order_params
    params.require(:order)
  end

end
