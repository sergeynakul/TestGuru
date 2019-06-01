class Answer < ApplicationRecord
  MAXIMUM_ANSWER = 4

  belongs_to :question

  validates :body, presence: true
  validate :answer_count

  scope :correct, -> { where correct: true }

  def answer_count
    errors.add(:base, 'У одного вопроса может быть от 1 до 4 ответов') if question.answers.size > MAXIMUM_ANSWER
  end
end
