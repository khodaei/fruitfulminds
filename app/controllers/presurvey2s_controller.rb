class Presurvey2sController < ApplicationController
  def new
    @all_schools = School.all
    @presurvey2_fields = Presurvey.new(params[:presurvey])
  end

  def create
    school = School.find_by_name(params[:school])
    begin
      @survey = school.presurveys.create!(params[:presurvey])
      flash[:notice] = "Results successfully added."
      redirect_to new_presurvey2s_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_presurvey2s_path(:presurvey => params[:presurvey])
    end
  end
end
