FactoryBot.define do
  factory :item do
    id {"1"}
    name {"商品名"}
    description {"詳細"}
    category_id {"686"}
    condition_id {"1"}
    postage_payer_id {"1"}
    prefecture_id {"1"}
    handling_id {"1"}
    price {"1000"}
    
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
