FactoryBot.define do
  factory :user_order do
    item_id {1}
    user_id {1}
    post_code {"123-4567"}
    prefectures_id {1}
    city {"緑市緑区"}
    house_number {"青山1-1-1"}
    building_name {"柳ビル103"}
    phone_number {"09012345678"}
  end
end
