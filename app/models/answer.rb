class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, presence: true
  validate :answer_count

  scope :correct_answers, -> { where correct: true }

  def answer_count
    errors.add(:base, 'У одного вопроса может быть от 1 до 4 ответов') unless Answer.where(question_id: question_id).count.between?(0, 5)
  end
end
