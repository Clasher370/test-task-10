FactoryGirl.define do
  factory :user, aliases: [:author] do
    nickname { Faker::Internet.user_name }
    email  { Faker::Internet.email("#{nickname}") }
    password 'secret'
    password_confirmation 'secret'
  end
end
