class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, except: :index

  def index
    @tests = Test.all
  end

  def start
    passage = PassedTest.new(user: current_user, test: @test)
    passage.set_timer!

    redirect_to current_user.passed_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
