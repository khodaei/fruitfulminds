class PostsurveysController < ApplicationController
  def new
    @all_schools = School.all
    @postsurvey_fields = Postsurvey.new(params[:postsurvey])
  end

  def create
    school = School.find(@school)
    begin
      ps = @current_user.postsurveys.new
      ps.school_semester_id = SchoolSemester.find(school)
      ps.update_attributes!(params[:postsurvey])
      flash[:notice] = "Results successfully added."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_postsurvey_path(:postsurvey => params[:postsurvey])
    end
  end

  def edit
    @postsurvey_fields = Postsurvey.find(params[:id])
  end
  
  def update
    begin
      Postsurvey.find(params[:id]).update_attributes!(params[:postsurvey])
      flash[:notice] = "Survey updated successfully."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to edit_postsurvey_path(:id => params[:id], :postsurvey => params[:postsurvey])
    end
  end
end
