require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能の実装' do
    context '商品出品がうまくいくとき' do
      it "全ての適切な値が存在する" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品破像を添付しない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名無しのとき" do
       @item.title = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it "商品の説明無しの時" do
        @item.concept = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end

      it "カテゴリー情報無し" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "カテゴリーで1を選択" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての記述が無し" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "商品状態で1を選択" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料についての記述が無し" do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it "配送料についてで1を選択" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end

      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送元の地域についてで1を選択" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.delivery_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it "発送までの日数について1を選択" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end

      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300円より下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9,999,999円より上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格に数字全角" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格に文字が入っている" do
        @item.price = "こんにちは"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
