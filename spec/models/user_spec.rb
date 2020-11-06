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
  it "emailに@を含む必要があること" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
      end
# パスワードが英数字確認のテスト▼
  it "passwordがない場合は登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
      end
  it "passwordが7文字以上での入力が必須であること" do
      password = Faker::Internet.password(min_length: 7, max_length: 7)
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user).to be_valid
      end
  it "passwordが6文字以下であれば登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end
  it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567" 
      @user.valid?
      expect(@user.errors[:password]).to include("is invalid")
      end
  it "encrypted_passwordがない場合は登録できないこと" do
      @user.encrypted_password = nil
      @user.valid?
      expect(@user.errors[:encrypted_password]).to include("can't be blank")
      end
# 確認パスワードが確認であるテスト▼
  it "passwordが存在してもencrypted_passwordがない場合登録できないこと"do
      @user.encrypted_password = ""
      @user.valid?
      expect(@user.errors[:encrypted_password]).to include("can't be blank","is too short (minimum is 7 characters)")
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
# 本人確認カタカナ全角入力テスト▼
  it "first_namae_kanaが全角カナでなければ登録できないこと" do
     @user.first_name_kana = "あいうえお"
     @user.valid?
     expect(@user.errors[:first_name_kana]).to include("is invalid")
     end
  it "last_name_kanaが全角カナでなければ登録できないこと" do
     @user.last_name_kana = "あいうえお"
     @user.valid?
     expect(@user.errors[:last_name_kana]).to include("is invalid")
     end
  it "birth_dateがない場合は登録できないこと" do
     @user.birth_date = nil
     @user.valid?
     expect(@user.errors[:birth_date]).to include("can't be blank")
     end
# メールアドレスのの一意性の検証▼
  it '重複しているemail存在する場合登録できないこと' do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
  end
end