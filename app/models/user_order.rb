class UserOrder
  include ActiveModel::Model
  attr_accessor :name, :encrypted_password, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
  
      # バリデーションの処理
      with_options presence: true do
        validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
        validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
        validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
      # 「住所」の郵便番号に関するバリデーション
        validates :postage_payer_id, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      # 「寄付金」に関するバリデーション
        validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
      end
      # 「住所」の都道府県に関するバリデーション
        validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
      # 「寄付金」の金額範囲に関するバリデーション
        validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
    
      def save
        # 各テーブルにデータを保存する処理
        # ユーザーの情報を保存し、「user」という変数に入れている
          user = User.create(name: name, encrypted_password: encrypted_password, nickname: nickname)
        # 住所の情報を保存
          Item.create(postage_payer_id: postage_payer_id, prefecture: prefecture_id, category_id: category_id, handling_id: handling_id, user_id: user.id)
        # 寄付金の情報を保存
          Item.create(price: price, user_id: user.id)
      end
     end

end
