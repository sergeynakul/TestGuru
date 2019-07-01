# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin', type: 'Admin', email: 'ror.test.e@gmail.com', confirmed_at: Time.zone.now, password: '123456',
            password_confirmation: '123456')
Category.create(title: 'Ruby')
Test.create(title: 'Ruby basics', category_id: 1, admin_id: 1)
Question.create(body: 'Who created the ruby language?', test_id: 1)
Answer.create(body: 'Matz', correct: true, question_id: 1)
Answer.create(body: 'John Doe', correct: false, question_id: 1)
Answer.create(body: 'Linus Torvalds', correct: false, question_id: 1)
Answer.create(body: 'Donald Duck', correct: false, question_id: 1)
Question.create(body: 'What method return a new array created by sorting self?', test_id: 1)
Answer.create(body: 'Inspect', correct: false, question_id: 2)
Answer.create(body: 'Sort', correct: true, question_id: 2)
Answer.create(body: 'Map', correct: false, question_id: 2)
Answer.create(body: 'Clone', correct: false, question_id: 2)
User.create(name: 'Sergey', email: 'sergey@mail.com', confirmed_at: Time.zone.now, password: '123456',
            password_confirmation: '123456')

Badge.create(title: 'Complete successfully category Ruby', img_url: 'https://img.icons8.com/dusk/64/000000/prize.png')
Badge.create(title: 'Complete for the first try', img_url: 'https://img.icons8.com/bubbles/64/000000/prize.png')
Badge.create(title: 'Complete the 0 level tests', img_url: 'https://img.icons8.com/color/64/000000/prize.png')

BadgeRule.create(rule: 'category_complete', value: 'Ruby', badge_id: 1)
BadgeRule.create(rule: 'first_try_complete', value: '', badge_id: 2)
BadgeRule.create(rule: 'level_complete', value: '0', badge_id: 3)
