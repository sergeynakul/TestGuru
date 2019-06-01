class AddCurrentQuestionNumberToPassedTest < ActiveRecord::Migration[5.2]
  def change
    add_column :passed_tests, :current_question_number, :integer, default: 0
  end
end
