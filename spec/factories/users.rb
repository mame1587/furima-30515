FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    last_name {'太郎'}
    first_name {'山田'}
    last_name_kana {'たろう'}
    first_name_kana {'やまだ'}
    birth_date {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end