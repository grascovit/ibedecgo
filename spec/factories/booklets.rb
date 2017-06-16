FactoryGirl.define do
  factory :booklet do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    year { Faker::Number.number(4) }
    category { Booklet.categories.keys.sample }
    attachment
    user
  end

  factory :invalid_booklet, parent: :booklet do
    title nil
    description nil
    year nil
    category nil
    attachment nil
    user nil
  end
end
