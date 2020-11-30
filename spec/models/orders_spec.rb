require 'rails_helper'

RSpec.describe Orders, type: :model do
  
  before do
    @order = FactoryBot.build(:order)
  end
  
  describe '#create' do 
    it "全ての必須項目が入力されている場合出品できる" do
    expect(@order).to be_valid 
    end
    context "必須項目が入力されている" do
      end
end
