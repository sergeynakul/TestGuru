class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.list_tests_by(category_title)
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
