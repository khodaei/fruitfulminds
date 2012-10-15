class HomeController < ApplicationController
  def index
    redirect_to("/portal") if current_user
  end
end
