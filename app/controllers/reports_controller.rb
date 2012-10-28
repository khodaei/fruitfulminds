class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    school = School.find(params[:school])
    if @current_user.presurveys.size > 0 and @current_user.postsurveys.size > 0
      @report = Report.create!(:school_id => params[:school])
      @report_created = true
      flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"
      redirect_to new_report_path
    else
      flash[:warning] = "#{school.name} does not have pre/post surveys"
      redirect_to new_report_path
    end
  end
  
  def generate
    #populate report
  end
  
end
