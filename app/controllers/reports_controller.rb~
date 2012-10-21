class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    school = School.find(params[:school])
    if school.presurveys.size > 0 and school.postsurveys.size > 0
      @report = Report.create!(:school_id => params[:school])
      flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"
      redirect_to portal_path
    else
      flash[:warning] = "#{school.name} does not have pre/post surveys"
      redirect_to new_reports_path
    end
  end
end
