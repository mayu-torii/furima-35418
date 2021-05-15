class OrdersController < ApplicationController



  def index
    @order_adress = OrderAdress.new
  end
end
