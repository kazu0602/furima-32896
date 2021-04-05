FactoryBot.define do
  factory :furima_registration do
    token{ "tok_abcdefghijk00000000000000000" }
    user_id { 1 }
    item_id { 1 }
    # purchase_id { 1 }
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '13' }
    building { '東京ハイツ' }
    phone_number { "00000000000" }
  end
end
