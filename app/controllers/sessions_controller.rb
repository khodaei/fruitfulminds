class SessionsController < ApplicationController

  def create
    user = User.where(:email => params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
