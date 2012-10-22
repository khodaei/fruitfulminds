class PresurveysController < ApplicationController
  def new
    @all_schools = School.all
    @presurvey_fields = Presurvey.new(params[:presurvey])
  end

  def create
    school = School.find(@school)
    begin
      ps = @current_user.presurveys.new
      ps.school_info_id = SchoolInfo.find(school)
      ps.update_attributes!(params[:presurvey])
      flash[:notice] = "Results successfully added."
      redirect_to new_presurveys_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_presurveys_path(:presurvey => params[:presurvey])
    end
  end
end
