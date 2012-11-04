class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    @schools = School.all
    school = School.find(params[:school])

    if @current_user.school == school
      if school.presurveys.size > 0 and school.postsurveys.size > 0
        @report = Report.create!(:school_id => params[:school])
        p @current_user.school
        p @current_user.school.presurveys
        @report_created = true
      
        #static content
        @static_contents = StaticContent.first
        #populate_objectives
        
        #dynamic content   
        @main_title = "Fruitful Minds #{school.name} Fall 2012 Report"
        @school_intro_title = "Fruitful Minds at #{school.name}"
        @school_intro = "School Intro Placeholder"
        @eval_intro = "School Eval Placeholder"
        @strength_weakness_title = "Strengths and Weaknesses of FM Lessons at #{school.name}"
        generate_strengths
        generate_weaknesses
      
        @objectives = {
                  "1. Nutrition-related Diseases" => "Discuss the relationship between nutrition and health; teach     students that poor diet choices could lead to obesity, diabetes and heart diseases.",
                  "2. Food Groups" => "Teach students the importance of nutrition by breaking down food groups and basic nutrition terminologies.",
                  "3. Nutrients" => "Discuss the metabolic functions of different nutrients; examine the quantities of fats, sugars, fiber and protein in various types of food.",
                  "4. Nutrition Labeling" => "Teach students how to read and understand food labels to determine which foods are healthier than others. ",
                  "5. Food Advertising " => "Explore the role that advertisements play in influencing consumer choice of food; let students know how to make healthy food choices based on knowledge rather than misleading advertisements.",
                  "6. Exercise, Energy and Nutrition" => "Identify the connection between food and energy, and the role that physical activities play in overall health and longevity.",
                   "7. Review lesson" => "Review major concepts covered in the previous lessons. Students are given a chance to practice problem-solving in different scenarios given the knowledge they have in nutrition."  }


        flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"
      else
        flash[:warning] = "#{school.name} does not have any Presurveys or Postsurveys"
        redirect_to new_report_path
      end
    else
      flash[:warning] = "Current user only has access to #{@current_user.school.name}"
      redirect_to new_report_path
    end
  end
  
  def generate_strengths
    @strengths = { 
                   "Q1 Strengths" => "S1 Placeholder",
                   "Q2 Strengths" => "S2 Placeholder",
                   "Q3 Strengths" => "S3 Placeholder",
                   "Q4 Strengths" => "S4 Placeholder",
                   "Q5 Strengths" => "S5 Placeholder",
                   "Q6 Strengths" => "S6 Placeholder",
                   "Q7 Strengths" => "S7 Placeholder",
                   "Q8 Strengths" => "S8 Placeholder",
                   "Q9 Strengths" => "S9 Placeholder",
                   "Q10 Strengths" => "S10 Placeholder"
                 }
  end

  def generate_weaknesses
    @weaknesses = {
                    "Q1 Weaknesses" => "W1 Placeholder",
                    "Q2 Weaknesses" => "W2 Placeholder",
                    "Q3 Weaknesses" => "W3 Placeholder",
                    "Q4 Weaknesses" => "W4 Placeholder",
                    "Q5 Weaknesses" => "W5 Placeholder",
                    "Q6 Weaknesses" => "W6 Placeholder",
                    "Q7 Weaknesses" => "W7 Placeholder",
                    "Q8 Weaknesses" => "W8 Placeholder",
                    "Q9 Weaknesses" => "W9 Placeholder",
                    "Q10 Weaknesses" => "W10 Placeholder",
                  }
  end

  def generate
    #populate report
  end

end
