class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  before_save :before_save_formatting_email

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def passed_tests_by(level)
    Test.joins(:passed_tests).where(passed_tests: { user_id: id }, level: level).pluck(:title)
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def before_save_formatting_email
    self.email = email.downcase
  end
end
