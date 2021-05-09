class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
  end

    
  private

  def user_params
    params.require(:item).permit(:email, :password, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end

end
