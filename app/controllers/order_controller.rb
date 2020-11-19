class OrderController < ApplicationController
  def index
    @order = Order.new
  end

  def create
  end
end
