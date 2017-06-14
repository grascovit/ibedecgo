FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user_id { create(:user).id }
  end

  factory :invalid_post, parent: :post do
    title nil
    body nil
    user_id nil
  end
end
