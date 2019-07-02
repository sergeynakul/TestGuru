class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def successfully?
    self.correct_questions == self.test.questions.count
  end

  def check_result
    BadgeUserService.new(self).call if successfully?
  end

  def set_timer
    if timer_present?
      return unless test.timer

      timer = test.timer

      self.time_end = Time.zone.now + (timer * 60)
    end
  end

  def set_timer!
    set_timer
    save!
  end

  def timer_present?
    self.test.timer.present?
  end

  def time_is_up?
    (time_end - Time.zone.now).negative? if timer_present?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if correct_answers
  end

  def correct_answers
    current_question&.answers&.correct
  end
end
