10.times do
  User.create!(nickname: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: 'secret',
              password_confirmation: 'secret')
end

users = User.all

users.each do |user|
  [*30..50].sample.times do
    user.posts.create!(title: Faker::Lorem.word,
                      body: Faker::Lorem.sentence(3),
                      published_at: Faker::Time.between(3.month.ago, DateTime.now))
  end
end

posts_ids = Post.ids

users.each do |user|
  [*50..100].sample.times do
    user.comments.create!(body: Faker::Lorem.sentence(3),
                         post_id: posts_ids.sample)
  end
end
