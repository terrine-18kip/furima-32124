FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"小渕"}
    first_name {"健太郎"}
    last_name_kana {"ウズマキ"}
    first_name_kana {"ナルト"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end