FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username(specifier: 5..10) }
    password { 'password' }
  end
end