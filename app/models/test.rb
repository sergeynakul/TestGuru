class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :simple_tests, -> { where level: 0..1 }
  scope :middle_tests, -> { where level: 2..4 }
  scope :difficult_tests, -> { where level: 5..Float::INFINITY }
  scope :list_tests_by, ->(category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title) }
end
