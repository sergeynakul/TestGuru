# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(5) do |x|
  Category.create(title: "Название_#{x}")
  User.create(name: "Имя_#{x}")
  Test.create(title: "Название_#{x}", level: x, category_id: x)
  Question.create(body: "Тело_#{x}", test_id: x)
  Answer.create(body: "Тело_#{x}", correct: true, question_id: x, user_id: x)
  PassedTest.create(user_id: x, test_id: x)
end

p "Создано #{Category.count} категорий"
p "Создано #{User.count} пользователей"
p "Создано #{Test.count} тестов"
p "Создано #{Question.count} вопросов"
p "Создано #{Answer.count} ответов"
p "Создано #{PassedTest.count} пройденных тестов"
