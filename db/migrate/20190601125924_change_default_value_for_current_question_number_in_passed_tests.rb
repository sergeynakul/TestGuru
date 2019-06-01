class ChangeDefaultValueForCurrentQuestionNumberInPassedTests < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:passed_tests, :current_question_number, from: 0, to: 1)
  end
end
