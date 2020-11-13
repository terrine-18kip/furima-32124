FactoryBot define do
  factory :user do
    nickname {Faker::JapaneseMedia::Naruto.character}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    encrypted_password {password}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end