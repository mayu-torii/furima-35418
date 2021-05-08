FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'漢字ひらがなカタカナ'}
    first_name            {'漢字ひらがなカタカナ'}
    family_name_kana      {'カタカナ'}
    first_name_kana       {'カタカナ'}
    birthday              {'1990-01-01'}
  end
end