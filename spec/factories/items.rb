FactoryBot.define do
  factory :item do
    id {1}
    name {"商品名"}
    description {"詳細"}
    category_id {2}
    condition_id {2}
    postage_payer_id {2}
    prefecture_id {2}
    handling_id {2}
    price {1000}
    user
    
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
