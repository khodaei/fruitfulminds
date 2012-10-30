class ReportsController < ApplicationController
  def new
    @schools = School.all
    @report_created = false
  end

  def create
    school = School.find(params[:school])

    if @current_user.presurveys.size > 0 and @current_user.postsurveys.size > 0
      @report = Report.create!(:school_id => params[:school])
      @report_created = true
      @static_contents = StaticContent.first
      puts school.name
      session[:intro_title] = @static_contents[:intro_title]
      session[:introduction] = @static_contents[:introduction]
      session[:objectives_title] = @static_contents[:objectives_title]
      session[:objectives] = @static_contents[:objectives]
      session[:strength_weakness_intro] = @static_contents[:strength_weakness_intro]
      session[:strength_intro] = @static_contents[:strength_intro]
      session[:weakness_intro] = @static_contents[:weakness_intro]
      session[:eval_title] = @static_contents[:eval_title]
      session[:summary] = @static_contents[:summary]
      
      #dynamic content
      session[:main_title] = "Fruitful Minds #{school.name} Fall 2012 Report"
      session[:school_intro_title] = "Fruitful Minds at #{school.name}"
      session[:school_introduction] = "School Intro Placeholder"
      session[:eval_intro] = "School Eval Placeholder"
      session[:strength_weakness_title] = "Strengths and Weaknesses of FM Lessons at #{school.name}"
      session[:strengths] = "Strengths Placeholder"
      session[:weaknesses] = "Weaknesses Placeholder"
      

      flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"
      redirect_to new_report_path
    else
      flash[:warning] = "#{school.name} does not have any Presurveys or Postsurveys"
      redirect_to new_report_path
    end
  end
  
  def generate
    #populate report
  end
  
end
