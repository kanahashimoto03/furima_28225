require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '出品情報の保存' do
    context '出品登録ができる時' do
      it '全ての情報が正しく入力できている時' do
        expect(@item).to be_valid
      end
    end

    context '出品登録ができない時' do
      it '画像は1枚必須であること(ActiveStorageを使用すること)' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.item_category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.item_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipping_area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.delivery_time = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it '価格についての情報が必須であること' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.item_price = 10_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of Range')
      end
    end
  end
end
