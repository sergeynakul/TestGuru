class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question, except: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_question_path(test_id: @test.id, id: @question.id)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_question_path(test_id: @test.id, id: @question.id)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(test_id: @test.id)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не был найден'
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
