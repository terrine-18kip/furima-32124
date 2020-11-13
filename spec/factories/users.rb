FactoryBot.define do
  factory :user do
    nickname {Faker::Name.middle_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    encrypted_password {password}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {"ウズマキ"}
    first_name_kana {"ナルト"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end