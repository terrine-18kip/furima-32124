class OrderController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.repuire(:order).permit(:price).merge(token: params[:token])
  end
end
