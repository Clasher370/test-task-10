FactoryGirl.define do
  factory :comment do
    body  { Faker::Lorem.sentence(3) }
    published_at { Time.now }
    author
    post
  end
end
