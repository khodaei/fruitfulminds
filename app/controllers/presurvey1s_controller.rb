class Presurvey1sController < ApplicationController
  def new
    @all_schools = School.all
    @presurvey1_fields = Presurvey.new(params[:presurvey])
  end

  def create
    school = School.find(session[:school])
    begin
      school.school_info.presurvey.create!(params[:presurvey])
      flash[:notice] = "Results successfully added."
      redirect_to new_presurvey1s_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_presurvey1s_path(:presurvey => params[:presurvey])
    end
  end
end
