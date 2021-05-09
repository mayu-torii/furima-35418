class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
  end

    
  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:item).permit(:email, :password, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end

end
