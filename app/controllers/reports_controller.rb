class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    @report = Report.create!
    redirect_to report_path(@report)
  end
end
