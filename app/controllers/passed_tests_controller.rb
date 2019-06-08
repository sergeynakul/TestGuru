class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_passed_test, only: %i[show result update]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      @passed_test.current_question_number += 1
      render :show
    end
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
