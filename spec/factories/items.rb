FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    concept { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    delivery_date_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end
