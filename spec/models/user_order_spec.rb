require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_order)
  end
  
    describe '#create' do
     it "全ての必須項目が入力されている場合出品ができる" do
     expect(@order).to be_valid
     end

     context "商品が購入できるとき" do
        it "郵便番号が入力必須、ハイフンが必須であること" do
          @order.post_code = ""
          @order.post_code = "1234567"
          @order.valid?
          expect(@order.errors[:post_code]).to include("is invalid. Include hyphen(-)")
        end
        it "都道府県が必須であること" do
          @order.prefectures_id = ""
          @order.valid?
        end
        it "市区町村が必須であること" do
          @order.city = ""
          @order.valid?
        end
        it "番地が必須であること" do
          @order.house_number = ""
          @order.valid?
        end
        it "電話番号が必須であること" do
          @order.phone_number = ""
          @order.valid?
        end
        it "tokenが必須であること" do
          @order.token = ""
          @order.valid?
        end
     end

     context "商品が購入ができないとき" do
        it "郵便番号には空では保存できないこと" do
            @order.post_code = nil
            @order.valid?
            expect(@order.errors[:post_code]).to include("can't be blank")
        end
        it "都道府県が0では保存できないこと" do
            @order.prefectures_id = 0
            @order.valid?
            expect(@order.errors[:prefectures_id]).to include("can't be blank")
        end
        it "電話番号はハイフンが不要であること" do
          @order.phone_number = "-"
          @order.valid?
          expect(@order.errors[:phone_number]).to include("is invalid")
        end
        it "電話番号は11桁以内でないと登録できないこと" do
          @order.phone_number = "09012345678"
          @order.valid?
          expect(@order.errors[:phone_number]).to include()
        end
        it "tokenが空では登録できないこと" do
          @order.token = nil
          @order.valid?
          expect(@order.errors[:token]).to include("can't be blank")
        end
     end
    end
end
