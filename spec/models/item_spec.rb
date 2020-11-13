require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
describe '#create' do 
  #商品しゅっぴんに関するテスト
  #正常系できる時と異常系できない時分ける
  #正常系のどんなテストするか整理　メモ　文字打つ
  #異常系のどんなテストするか整理　メモ　文字打つ
  #テストコードを書いていく
 it "全ての必須項目が入力されている場合出品できる" do
 expect(@item).to be_valid 
 end

 describe 'ログインユーザーが遷移する為のページ'do
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
    @item.category_id = ""
    @item.valid?
  end
  it "商品の状態についての情報が必須であること" do
    @item.condition_id = ""
    @item.valid?
  end
  it "配送料の負担についての情報が必須であること" do
    @item.postage_payer_id = ""
    @item.valid?
  end
  it "発送元の地域についての情報が必須であること" do
    @item.prefecture_id = ""
    @item.valid?
  end
  it "発送までの日数についての情報が必須である" do
    @item.handling_id = ""
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
end

 end
end
