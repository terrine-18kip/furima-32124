FactoryBot.define do
  factory :order_address do
    postal_number { '123-4567' }
    prefecture_id { 23 }
    city { '名古屋市中区' }
    street { '栄' }
    building { '栄センタービル' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
