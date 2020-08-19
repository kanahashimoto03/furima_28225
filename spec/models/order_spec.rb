require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do 
      @order = FactoryBot.build(:order)
    end

    context '商品の購入ができるとき' do
      it '全ての情報が正しく入力できている時' do
        expect(@order).to be_valid
      end

      it '建物名は空でも購入ができること' do 
        @order.building_name = nil 
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it '配送先の情報として、郵便番号が必須であること' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include ("Postal code can't be blank") 
      end
      
      it '配送先の情報として、都道府県が必須であること' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      
      it '配送先の情報として、市区町村が必須であること' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の情報として、番地が必須であること' do
        @order.house_number = nil
        @order.valid? 
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '配送先の情報として、電話番号が必須であること' do
        @order.phone_number = nil 
        @order.valid? 
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
     
      it '郵便番号にはハイフンが必要であること' do 
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code Input correctly")
      end

      it '電話番号にはハイフンは不要であること' do 
        @order.phone_number = '24-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input correctly")
      end

      it '電話番号は11桁以内であること' do 
        @order.phone_number = '1234567890123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input correctly")
      end
    end
  end
end
