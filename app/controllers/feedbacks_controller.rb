class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    
    if @feedback.save
      FeedbacksMailer.send_message(@feedback).deliver_now
      redirect_to root_path, notice: 'Feedback sent'
    else
      render :new, alert: 'Feedback did not sent.'
    end
  end
  
  private
  
  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
