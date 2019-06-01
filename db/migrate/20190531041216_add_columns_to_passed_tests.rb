class AddColumnsToPassedTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :passed_tests, :current_question, foreign_key: true
    add_column :passed_tests, :correct_questions, :integer, default: 0
  end
end
