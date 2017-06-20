FactoryGirl.define do
  factory :booklet do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    year { Faker::Number.number(4).to_i }
    category { Booklet.categories.keys.sample }
    attachment { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/document.pdf", 'application/pdf') }
    user_id { create(:user).id }
  end

  factory :invalid_booklet, parent: :booklet do
    title nil
    description nil
    year nil
    category nil
    attachment nil
    user_id nil
  end
end
