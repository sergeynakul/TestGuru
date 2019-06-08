class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, except: :index

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.passed_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
