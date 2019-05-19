class User < ApplicationRecord
  has_many :answers
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  def passed_tests_by(level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: id }, level: level).pluck(:title)
  end
end
