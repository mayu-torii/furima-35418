require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できるとき' do
    it 'name、description、category_id、condition_id、shipping_fee_id、shipping_place_id、shipping_days_id、price、user_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end
    end
  end

    context '商品出品登録できないとき' do
    it '商品画像を添付しないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include{"Image can't be blank"}
    end

    it 'nameがない場合は登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionがない場合は登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'descriptionがない場合は登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idがない場合は登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idがない場合は登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'shipping_fee_idがない場合は登録できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it 'shipping_place_idがない場合は登録できない' do
      @item.shipping_place_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place can't be blank")
    end

    it 'shipping_days_idがない場合は登録できない' do
      @item.shipping_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it 'priceがない場合は登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price out of setting range")
    end

    it '売価格は、¥300~¥9,999,999の間でなければ登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end

 
  end  
end