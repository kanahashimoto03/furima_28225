require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ツイートの保存' do
    context 'ユーザー登録ができる時' do
      it 'すべての情報が正しく登録できている時、登録できる' do
        expect(@user).to be_valid
      end
    end
   
    context 'ユーザー登録ができない時' do
      it 'ニックネームが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'メールアドレスが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが＠を含んでいなければ登録できないこと' do
        @user.email = 'kanahashimoto03'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが空だと登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードは6文字以上でなければ登録できないこと' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'パスワードは半角英数字混合でなければ登録できないこと' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'パスワードは確認用含めて2回入力しなければ登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'ユーザー本名が、名字が空だと登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'ユーザー本名が名前が空だと登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'ユーザー本名は全角で入力しなければ登録できないこと' do
        @user.family_name = 'hashimoto'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name Full-width characters'
      end

      it 'ユーザー本名は全角で入力しなければ登録できないこと' do
        @user.last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end

      it 'ユーザー本名のフリガナが名字が空だと登録できないこと' do
        @user.family_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name reading can't be blank"
      end

      it 'ユーザー本名のフリガナが名前が空だと登録できないこと' do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name reading can't be blank"
      end

      it 'ユーザー本名のフリガナは全角(カタカナ)で入力しなければ登録できないこと' do
        @user.family_name_reading = '橋本'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name reading Full-width katakana characters'
      end

      it 'ユーザー本名のフリガナは全角(カタカナ)で入力しなければ登録できないこと' do
        @user.last_name_reading = '佳奈'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading Full-width katakana characters'
      end

      it '生年月日が空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end


