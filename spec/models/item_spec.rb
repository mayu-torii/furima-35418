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

    it 'category_idは1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idは1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'shipping_fee_idは1では登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end

    it 'shipping_place_idは1では登録できない' do
      @item.shipping_place_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping place must be other than 1")
    end

    it 'shipping_days_idは1では登録できない' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
    end

    it 'priceがない場合は登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price out of setting range")
    end

    it '売価格は¥300未満だと登録できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end

    it '売価格は¥10,000,000以上だと登録できない' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end
   end  
end