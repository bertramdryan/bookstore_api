FactoryBot.define do
    factory :book do
        title { Faker::Book.title }
        author { Faker::Book.author }
        category { Faker::Book.title }
    end
end