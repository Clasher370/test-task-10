FactoryGirl.define do
  factory :user, aliases: [:author] do
    nickname { Faker::Internet.user_name }
    email  { Faker::Internet.email("#{nickname}") }
    password 'secret'
    password_confirmation 'secret'

    factory :user_with_twenty_posts do
      after(:create) do |user|
        20.times { create(:post, author: user) }
      end
    end
  end
end
