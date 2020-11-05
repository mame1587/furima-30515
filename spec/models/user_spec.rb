require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  it "全ての項目の入力が存在すれば登録できること" do
    expect(@user).to be_valid
  end 

  it "emailがない場合は登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
      end
  it "passwordがない場合は登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
      end
  it "encrypted_passwordがない場合は登録できない" do
      @user.encrypted_password = nil
      @user.valid?
      expect(@user.errors[:encrypted_password]).to include("can't be blank")
      end
  it "first_nameがない場合は登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
      end
  it "last_nameがない場合は登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")
      end
  it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end
  it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end
  it "birth_dateがない場合は登録できないこと" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors[:birth_date]).to include("can't be blank")
      end

  it '重複しているemail存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  end
end