module PassedTestsHelper
  def percentage_success
    @passed_test.correct_questions * 100 / @passed_test.test.questions.count
  end
end
