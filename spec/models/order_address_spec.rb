require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @order_address = FactoryBot.build(:order_address, user_id: buyer.id, item_id: item.id)
    sleep(2)
  end

  describe '購入者情報登録' do
    context '購入者情報が登録される時' do
      it 'postal_code、prefecture_id、city、street_number、telephone、tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it 'telephoneは11桁以内だと登録できる' do
        @order_address.building_name = '12345678901'
        expect(@order_address).to be_valid
      end
    end

  
    context '購入者情報が登録されない時' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeにハイフンがないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idは1では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityはが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空では登録できない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end

      it 'telephoneはが空では登録できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneが12桁以上だと登録できない' do
        @order_address.telephone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'telephoneは英数混合では登録では登録できない' do
        @order_address.telephone = 'abc09012345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end

    end 
  end
end
