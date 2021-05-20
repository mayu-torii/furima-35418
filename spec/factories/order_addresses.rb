FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '江東区' }
    street_number { '1-1' }
    building_name { '建物名' }
    telephone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
