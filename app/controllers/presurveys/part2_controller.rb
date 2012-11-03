class Presurveys::Part2Controller < ApplicationController
  def new
    @all_schools = School.all
    @presurvey_part2_fields = Presurvey::Part2.new(params[:presurvey_part2])
  end

  def create
    school = School.find(@school)
    begin
      ps = @current_user.presurvey_part2s.new
      ps.school_semester_id = SchoolSemester.find(school)
      ps.update_attributes!(params[:presurvey_part2])
      flash[:notice] = "Results successfully added."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_presurveys_part2_path(:presurvey_part2 => params[:presurvey_part2])
    end
  end

  def edit
    @presurvey_part2_fields = Presurvey::Part2.find(params[:id])
  end
  
  def update
    begin
      Presurvey::Part2.find(params[:id]).update_attributes!(params[:presurvey_part2])
      flash[:notice] = "Survey updated successfully."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to edit_presurveys_part2_path(:id => params[:id], :presurvey_part2 => params[:presurvey_part2])
    end
  end
end
