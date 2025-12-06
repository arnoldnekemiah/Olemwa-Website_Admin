FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    event_date { "2025-12-06 23:27:17" }
    location { "MyString" }
    registration_url { "MyString" }
    status { 1 }
  end
end
