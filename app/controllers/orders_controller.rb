class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.save
       redirect_to root_path
    else
       render :index
    end   
  end


  private

  def order_address_params
    params.permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
