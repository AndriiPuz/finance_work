FactoryBot.define do
  factory :operation do
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    description { Faker::Lorem.sentence(word_count: 70) }
    operation_date { Faker::Date.between(from: '2023-01-11', to: Date.today) }
    operation_type { ["outlay", "income"].sample }
    category
    user
  end
end

