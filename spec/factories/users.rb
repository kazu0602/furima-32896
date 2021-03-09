FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name  {'田中'}
    given_name   {'太郎'}
    family_name_kana   {'タナカ'}
    given_name_kana   {'タロウ'}
    birth   {'19950602'}
  end
end