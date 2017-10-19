FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word }
    body  { Faker::Lorem.sentence(3) }
    published_at { Time.now }
    author
  end
end
