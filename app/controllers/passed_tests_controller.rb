class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_passed_test, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids] || [])

    if @passed_test.completed? || @passed_test.time_is_up?
      @passed_test.check_result
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      @passed_test.current_question_number += 1
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@passed_test.current_question).call

    flash_options = if result.created_at
                      Gist.create(url: result.html_url, question: @passed_test.current_question, user: current_user)
                      { notice: t('.success', link: (helpers.link_to 'Gist', result.html_url, target: '_blank', rel: 'noopener')) }
                    else
                      { notice: t('.failure') }
    end

    redirect_to @passed_test, flash_options
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
