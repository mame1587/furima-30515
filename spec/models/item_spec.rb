require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '#create' do 
    it "全ての必須項目が入力されている場合出品できる" do
    expect(@item).to be_valid 
    end
    context "必須項目が入力されている" do
      it "商品名が必須であること" do
        @item.name = ""
        @item.valid?
      end
      it "商品の説明が必須であること" do
        @item.description = ""
        @item.valid?
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = 1
        @item.valid?
      end
      it "商品の状態についての情報が必須であること" do
        @item.condition_id = 1
        @item.valid?
      end
      it "配送料の負担についての情報が必須であること" do
        @item.postage_payer_id = 1
        @item.valid?
      end
      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id = 1
        @item.valid?
      end
      it "発送までの日数についての情報が必須である" do
        @item.handling_id = 1
        @item.valid?
      end
      it "価格の範囲が¥300~¥9,999,999の間であること" do
        @item.price = "¥300~¥9,999,999"
        @item.valid?
      end
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "123456"
        expect(@item).to be_valid
      end
    end
      context "必須項目が入力されていないとき" do
        it "画僧が空では保存できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors[:image]).to include("can't be blank")
        end
        it "名前が空では保存できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
        end
        it "詳細が空では保存できないこと" do
          @item.description = nil
          @item.valid?
          expect(@item.errors[:description]).to include("can't be blank")
        end
        it "販売価格が空では保存できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
        end
        it "価格の範囲が空では保存できないこと"do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("is not included in the list")
        end
        it "価格の範囲が上限以下では保存できないこと" do
        @item.price = 9999999
        @item.valid?
        expect(@item.errors[:price]).to include()
        end
        it "価格の範囲が下限以下では保存できないこと" do
        @item.price = 300
        @item.valid?
        expect(@item.errors[:price]).to include()
        end
        it "カテゴリーが1では保存できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("must be other than 1")
        end
        it "商品の状態が1では保存できないこと" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors[:condition_id]).to include("must be other than 1")
        end
        it "配送料の負担が1では保存できないこと" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors[:postage_payer_id]).to include("must be other than 1")
        end
        it "発送元の地域が1では保存できないこと" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors[:prefecture_id]).to include("must be other than 1")
        end
        it "発送までの日数が1では保存できないこと" do
          @item.handling_id = 1
          @item.valid?
          expect(@item.errors[:handling_id]).to include("must be other than 1")
        end
      end

    
  end
end