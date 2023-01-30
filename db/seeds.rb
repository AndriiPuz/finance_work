# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

categories = [
  { name: "Комп'ютери", description: "Персональні комп'ютери, ігрові комп'ютери, робочі станції"},
  { name: "Мобільні телефони", description: "Мобільні телефони та аксесуари для них"},
  { name: "Спорт", description: "Спорт і спортивне харчування"},
  { name: "Книги", description: "Книги і канцтовари"},
  { name: "Транспорт", description: "Транспорт"},
  { name: "Розваги", description: "Компютерні та настільні ігри"},
  { name: "Відпочинок", description: "Відпочинок і лікування"},
  { name: "Будівництво", description: "Будівництво та цивільна інженерія"},
  { name: "Пиво і до пива", description: "Крафтове пиво і закуски до пива"},
  { name: "Продукти харчування", description: "Продукти харчування"}
]

categories.each do |c|
  Category.create(name: c[:name], description: c[:description], user_id: 1)
end

Category.all.each do |c|
  10.times do Operation.create(category_id: c.id,
    user_id: 1, description: Faker::Quotes::Shakespeare.as_you_like_it,
    operation_date: Faker::Date.between(from: '2022-10-23', to: Date.today),
    amount: Faker::Number.decimal(l_digits: 3, r_digits: 2)
   )
  end
end
