class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    @schools = School.all
    @school = School.find(params[:school])

    if @current_user.school == @school
      if @school.presurveys.size > 0 and @school.postsurveys.size > 0
        @report = Report.create!(:school_id => params[:school])
        @report_created = true
      
        #static content
        @static_contents = StaticContent.first
        #populate_objectives
        
        #dynamic content
        @ambassadors = ""   
        @school.users.each do |user|
          @ambassadors += user.name + ", "
        end
                         
        @main_title = "Fruitful Minds #{@school.name} Fall 2012 Report"
        @school_intro_title = "Fruitful Minds at #{@school.name}"
        @school_intro = "Fruitful Minds held a nutrition lesson series at #{@school.name} during SEMESTER" 
        @school_intro_second = "    #{@school.users.size} students from UC Berkeley #{@ambassadors} were selected as Fruitful Minds ambassadors"    
        @school_intro_third = "    During each 50-minute lesson, class facilitators delivered the cirriculum material through lectures, games, and various interactive activities."
        @eval_intro_first = "Prior to the 7-week curriculum, a pre-curriculum survey was distributed to assess the students knowledge in nutrition; a very similar survey was administered during the final class. The goal of the surveys was to determine the retention of key learning objectives from the Fruitful Minds program."
        @efficacy = calculate_efficacy
        @eval_intro_second = "On average, students have shown a #{@efficacy}% improvement after going through seven weeks of classes." 
        @eval_intro_third = "The survey results are shown below. The first graph shows the average scores in each of the six nutrition topics covered in the curriculum (see graph 1). Note that the number of questions in each category varies. The second graph shows students overall performance on the pre-curriculum surveys and post-curriculum survey (see graph 2). Sixteen students took the pre-curriculum survey, and eleven students took the post-curriculum surveys."
        @strength_weakness_title = "Strengths and Weaknesses of FM Lessons at #{@school.name}"
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
        flash[:warning] = "#{@school.name} does not have any Presurveys or Postsurveys"
        redirect_to new_report_path
      end
    else
      flash[:warning] = "Current user only has access to #{@current_user.school.name}"
      redirect_to new_report_path
    end
  end
  
  def generate_strengths
    @strengths = { 
                   "Q1 Strengths" => "Students understood factors that may lead to type 2 diabetes",
                   "Q2 Strengths" => "Students learned the five different food groups included in USDAs 'My Plate.' Students understood that all five food groups are important to help us achieve a balanced diet.",
                   "Q3 Strengths" => "Students could recall the numbers of servings one needs for each food group.",
                   "Q4 Strengths" => "Students could recall the different macro- and micronutrients.",
                   "Q5 Strengths" => "Students demonstrated improvement in interpreting nutrition labels.",
                   "Q6 Strengths" => "Students recognized the goals of food advertisements, as well as the techniques that food companies use to promote their products.",
                   "Q7 Strengths" => "Students were able to distinguish between the advertising and factual components on a food package.",
                   "Q8 Strengths" => "Students demonstrated knowledge in the benefits of physical activities, as well as the recommended amount of exercise.",
                   "Q9 Strengths" => "Students could identify different types of physical activities."
                 }
  end

  def generate_weaknesses
    @weaknesses = {
                    "Q1 Weaknesses" => "Students didnt completely understand the difference between each nutrient.",
                    "Q2 Weaknesses" => "Some students had trouble distinguishing between food groups and nutrients.",
                    "Q3 Weaknesses" => "Some students had trouble using math to calculate the numbers of servings and total calories of a food package.",
                    "Q4 Weaknesses" => "Some students didnt understand that calorie is a measure of energy in food."
                  }
  end

  def generate
    #populate report
  end

  def calculate_efficacy
    @ps = @school.presurveys[0]
    @efficacy_pre = 0
    6.times do |i|
       p @efficacy_pre += @ps["section_#{i + 1}"]
    end
    @ps = @school.postsurveys[0]
    @efficacy_post = 0
    6.times do |i|
       p @efficacy_post += @ps["section_#{i + 1}"]
    end
    (@efficacy_post-@efficacy_pre)/@efficacy_pre*100
  end

end
