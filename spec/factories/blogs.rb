FactoryBot.define do
  factory :blog do
    title { "MyString" }
    slug { "MyString" }
    content { "MyText" }
    status { 1 }
    published_at { "2025-12-06 23:27:10" }
    admin { nil }
  end
end
