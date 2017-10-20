FactoryGirl.define do
  factory :user, aliases: [:author] do
    nickname { Faker::Internet.user_name }
    email  { Faker::Internet.email("#{nickname}") }
    password 'secret'
    password_confirmation 'secret'

    factory :user_with_five_posts do
      after(:create) do |user|
        5.times { create(:post, author: user) }
      end
    end
  end
end
