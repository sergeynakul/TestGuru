class FeedbacksMailer < ApplicationMailer
  def send_message(feedback)
    @user = feedback.user
    @message = feedback.message

    mail(to: User.find_by(type: 'Admin').email, subject: 'Feedback')
  end
end
