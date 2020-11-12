require 'rails_helper'

RSpec.describe Item, type: :model do

describe '#create' do
before do
  @item = FactoryBot.build(:item)
 end

 it "全ての必須項目が入力されている場合出品できる" do
 expect(@item).to be_valid 
 end

end
end
