class HomeController < ApplicationController
  def index
    session[:school] = School.find(1)
    redirect_to("/portal") if current_user
  end
end
