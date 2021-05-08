require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end

   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが半角数字のみの時は登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが半角英字のみの時はでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'password_confirmationが半角英字のみの時はでは登録できない' do
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end
  
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
  
    it "family_nameに関して、漢字・平仮名・カタカナ以外は登録できない" do
      @user.family_name = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    
    it "last_nameに関して、漢字・平仮名・カタカナ以外は登録できない" do
      @user.first_name = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "family_name_kanaに関して、全角カタカナ以外では登録できない" do
      @user.family_name_kana = 'aa11ひらがな漢字ｶﾀｶﾅ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "first_name_kanaに関して、全角カタカナ以外では登録できない" do
      @user.first_name_kana = 'aa11ひらがな漢字ｶﾀｶﾅ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end  

  end
 end
end 