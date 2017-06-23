FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user
  end

  factory :invalid_post, parent: :post do
    title nil
    body nil
    user nil
  end
end
