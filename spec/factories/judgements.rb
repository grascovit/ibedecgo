FactoryGirl.define do
  factory :judgement do
    title { Faker::Lorem.sentence }
    released_at { Faker::Date.between(2.days.ago, 2.days.from_now) }
    category { Judgement.categories.keys.sample }
    attachment { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/document.pdf", 'application/pdf') }
    user_id { create(:user).id }
  end

  factory :invalid_judgement, parent: :judgement do
    title nil
    released_at nil
    category nil
    attachment nil
    user_id nil
  end
end
