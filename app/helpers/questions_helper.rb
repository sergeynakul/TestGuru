module QuestionsHelper
  def question_header
    if @question.new_record?
      "Create New #{@test.title} Question"
    else
      "Edit #{@test.title} Question"
    end
  end
end
