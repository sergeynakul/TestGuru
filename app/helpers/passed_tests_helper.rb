module PassedTestsHelper
  SUCCESS_RATE = 85

  def result_message
    percentage_success = @passed_test.correct_questions * 100 / @passed_test.test.questions.count
    if percentage_success >= SUCCESS_RATE
      content_tag(:p, "You have successfully passed the test, the percentage of success - #{percentage_success}%", style: 'color: green')
    else
      content_tag(:p, "Test failed, the percentage of success - #{percentage_success}%", style: 'color: red')
    end
  end
end
