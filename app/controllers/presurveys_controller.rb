class PresurveysController < ApplicationController
  def new
    @all_schools = School.all
  end

  def create
    school = School.find_by_name(params[:school])
    @survey = school.presurveys.create!(params[:presurvey])
    flash[:notice] = "Results successfully added."
    redirect_to presurveys_path
  end
end
