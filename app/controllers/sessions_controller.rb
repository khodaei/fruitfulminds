class SessionsController < ApplicationController
  skip_before_filter :current_user

  def create
    user = User.where(:email => params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/portal'
    else
      flash[:warning] = "Incorrect #{user.nil? ? 'email/' : ''}password! Please try again."
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
