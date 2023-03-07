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
user = User.create(email: "testuser@mail.com", password: "123456")
user.categories.create(categories)
user.categories.all.each do |category|
  FactoryBot.create_list(:operation, 10, user: user, category: category)
end


