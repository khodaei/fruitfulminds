class ReportsController < ApplicationController
  def new
    @schools = School.all

    @objectives = {
                "1. Nutrition-related Diseases" => "Discuss the relationship between nutrition and health; teach     students that poor diet choices could lead to obesity, diabetes and heart diseases.",
                "2. Food Groups" => "Teach students the importance of nutrition by breaking down food groups and basic nutrition terminologies.",
                "3. Nutrients" => "Discuss the metabolic functions of different nutrients; examine the quantities of fats, sugars, fiber and protein in various types of food.",
                "4. Nutrition Labeling" => "Teach students how to read and understand food labels to determine which foods are healthier than others. ",
                "5. Food Advertising " => "Explore the role that advertisements play in influencing consumer choice of food; let students know how to make healthy food choices based on knowledge rather than misleading advertisements.",
                "6. Exercise, Energy and Nutrition" => "Identify the connection between food and energy, and the role that physical activities play in overall health and longevity.",
                 "7. Review lesson" => "Review major concepts covered in the previous lessons. Students are given a chance to practice problem-solving in different scenarios given the knowledge they have in nutrition."  }

  end

  def create
    school = School.find(params[:school])

    if @current_user.presurveys.size > 0 and @current_user.postsurveys.size > 0
      @report = Report.create!(:school_id => params[:school])
      @report_created = true
      
      #static content
      @static_contents = StaticContent.first
      session[:intro_title] = @static_contents[:intro_title]
      session[:introduction] = @static_contents[:introduction]
      session[:objectives_title] = @static_contents[:objectives_title]
      #session[:objectives] = @static_contents[:objectives]
      populate_objectives
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
