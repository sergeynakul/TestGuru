class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :name, :email, presence: true

  def passed_tests_by(level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: id }, level: level).pluck(:title)
  end
end
