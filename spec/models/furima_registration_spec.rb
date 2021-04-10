require 'rails_helper'

RSpec.describe FurimaRegistration, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @furima_registration = FactoryBot.build(:furima_registration, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能の実装' do
    context '商品購入がうまくいくとき' do
      it '全ての適切な値が存在する' do
        expect(@furima_registration).to be_valid
      end

      it '建物名無し' do
          @furima_registration.building = ''
          expect(@furima_registration).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空のとき' do
        @furima_registration.token = nil
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Token can't be blank")
      end

      it 'ポストコードにハイフン無し' do
        @furima_registration.postcode = '12345678'
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Postcode is invalid')
      end

      it '数字が全角' do
        @furima_registration.postcode = '１２３-４５６７８'
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Postcode is invalid')
      end

      it 'ポストコードが空' do
        @furima_registration.postcode = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Postcode is invalid')
      end

      it '都道府県が空' do
        @furima_registration.prefecture_id = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都市部分が空' do
        @furima_registration.block = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空' do
        @furima_registration.phone_number = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンが入る' do
        @furima_registration.phone_number = '080-0000-0000'
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が大文字' do
        @furima_registration.phone_number = '０８０００００００００'
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が7桁以下（ありえない桁）' do
        @furima_registration.phone_number = '1234567'
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が7桁以下（ありえない桁）' do
        @furima_registration.phone_number = 'abcdefg'
        @furima_registration.valid?
        binding.pry
        expect(@furima_registration.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空' do
        @furima_registration.user_id = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Phone number is invalid")
      end

      it 'item_idが空' do
        @furima_registration.item_id = ''
        @furima_registration.valid?
        expect(@furima_registration.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
