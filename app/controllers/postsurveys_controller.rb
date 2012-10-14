class PostsurveysController < ApplicationController
  def new
    @all_schools = School.all
  end

  def create
    @survey = Postsurvey.create!(params[:postsurvey])
    redirect_to presurvey_path
  end
end
