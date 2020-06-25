FactoryBot.define do
  factory :user do
    name { "hoge" }
    email { "foo@bar.com" }
    password { "test1234"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
