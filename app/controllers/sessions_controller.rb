class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email].downcase.strip)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:url] || root_path
      session.delete(:url)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, alert: 'You exit'
  end
end
