class SessionsController < ApplicationController

  def create
    user = User.where(:email => params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
#session[:user_id] = user.id
      redirect_to '/portal'
    else
      flash[:warning] = "Incorrect #{user.nil? ? 'email/' : ''}password! Please try again."
      redirect_to login_path
    end
  end

  def destroy
#   session[:user_id] = nil
    redirect_to "/"
  end

end
