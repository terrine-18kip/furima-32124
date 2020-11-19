FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explain { Faker::Lorem.sentence }
    category_id { 1 }
    status_id { 1 }
    ship_cost_id { 1 }
    prefecture_id { 1 }
    schedule_id { 1 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_3444.jpg'), filename: 'IMG_3444.jpg')
    end
  end
end
