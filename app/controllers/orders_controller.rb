class OrdersController < ApplicationController



  def index
    @order_adress = OrderAdress.new
  end

  def create
    binding.pry
  end

end
