FactoryBot.define do
  factory :category do
    name { Faker::Company.unique.name }
    description { Faker::Lorem.sentence(word_count: 20) }
    user
  end
end
