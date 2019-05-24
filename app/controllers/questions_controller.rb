class QuestionsController < ApplicationController
  before_action :set_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    @question = @test.questions.find(params[:id])
    render plain: @question.inspect
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    render plain: @test.questions.inspect
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не был найден'
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
