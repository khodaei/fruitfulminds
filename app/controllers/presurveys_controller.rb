class PresurveysController < ApplicationController
  def new
    @all_schools = School.all
  end

  def create
    @survey = Presurvey.create!(params[:presurvey])
    flash[:notice] = "Results successfully added."
    redirect_to presurvey_path
  end
end
