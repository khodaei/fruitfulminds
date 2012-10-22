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
      redirect_to new_presurveys_part1_path(:presurvey => params[:presurvey])
    end
  end

  def edit
    @presurvey_fields = Presurvey.find(params[:id])
  end
  
  def update
    begin
      Presurvey.find(params[:id]).update_attributes!(params[:presurvey])
      flash[:notice] = "Survey updated successfully."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to edit_presurveys_part1_path(:id => params[:id], :presurvey => params[:presurvey])
    end
  end
end
