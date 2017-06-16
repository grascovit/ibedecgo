FactoryGirl.define do
  factory :judgement do
    title { Faker::Lorem.sentence }
    released_at { Faker::Date.between(2.days.ago, 2.days.from_now) }
    category { Judgement.categories.keys.sample }
    attachment
    user
  end

  factory :invalid_judgement, parent: :judgment do
    title nil
    released_at nil
    category nil
    attachment nil
    user nil
  end
end
