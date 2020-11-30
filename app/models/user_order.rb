class UserOrder
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :building_name, :phone_number, :house_number, :city, :prefectures_id

    with_options presence: true do
        # 「order」のテーブルバリデーション
        validates :item_id
        validates :user_id
        # 「addresses」のテーブルバリデーション
        validates :post_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :building_name
        validates :phone_number
        validates :house_number
        validates :city
        validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
      end


      def save
        # 各テーブルにデータを保存する処理
        # orderのテーブル情報を保存
          @orders = Order.create(item_id: item_id, user_id: user_id)
        # addressのテーブル情報を保存
          Address.create(post_code: post_code, building_name: building_name, phone_number: phone_number, house_number: house_number, city: city, prefectures_id: prefectures_id, order_id: @orders.id)
      end
end