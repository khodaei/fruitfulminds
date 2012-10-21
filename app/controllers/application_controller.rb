class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  protected
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    redirect_to login_path unless @current_user
  end
end
