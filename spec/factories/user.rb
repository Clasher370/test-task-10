FactoryGirl.define do
  factory :user, aliases: [:author] do
    nickname { Faker::Internet.user_name }
    email  { Faker::Internet.email("#{nickname}") }
    password 'secret'

    factory :user_with_20_posts_10_comments do
      after(:create) do |user|
        create_list(:post, 20, author: user)
        create_list(:comment, 10, author: user, post: user.posts.first)
      end
    end
  end
end
