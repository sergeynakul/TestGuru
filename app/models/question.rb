class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :gists
  has_many :passed_tests

  validates :body, presence: true
end
