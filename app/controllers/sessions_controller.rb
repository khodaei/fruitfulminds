class SessionsController < ApplicationController

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      flash[:notice] = "user exists"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "user does not exist"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
