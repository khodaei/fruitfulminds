class PostsurveysController < ApplicationController
  def new
    @all_schools = School.all
    @postsurvey_fields = Postsurvey.new(params[:postsurvey])
  end

  def create
    school = School.find(@school)
    begin
      ps = @current_user.postsurveys.new
      ps.school_info_id = SchoolInfo.find(school)
      ps.update_attributes!(params[:postsurvey])
      flash[:notice] = "Results successfully added."
      redirect_to new_postsurveys_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_postsurveys_path(:postsurvey => params[:postsurvey])
    end
  end
end
