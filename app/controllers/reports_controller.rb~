class ReportsController < ApplicationController
  def new
    @schools = School.all
  end

  def create
    @schools = School.all
    @school = School.find(params[:school])

    if @current_user.school == @school
      if @school.presurveys.size > 1 and @school.postsurveys.size > 0
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
        @school_intro = "Fruitful Minds held a nutrition lesson series at #{@school.name} during Fall 2012" 
        @school_intro_second = "    #{@school.users.size} students from UC Berkeley #{@ambassadors} were selected as Fruitful Minds ambassadors"    
        @school_intro_third = "    During each 50-minute lesson, class facilitators delivered the cirriculum material through lectures, games, and various interactive activities."
        @eval_intro_first = "Prior to the 7-week curriculum, a pre-curriculum survey was distributed to assess the students\' knowledge in nutrition; a very similar survey was administered during the final class. The goal of the surveys was to determine the retention of key learning objectives from the Fruitful Minds program."
        @efficacy = calculate_efficacy
        @eval_intro_second = "On average, students have shown a #{@efficacy}% improvement after going through seven weeks of classes." 
        @eval_intro_third = "The survey results are shown below. The first graph shows the average scores in each of the six nutrition topics covered in the curriculum (see graph 1). Note that the number of questions in each category varies. The second graph shows students\' overall performance on the pre-curriculum surveys and post-curriculum survey (see graph 2). #{@school.presurveys[0].number_students} students took the pre-curriculum survey, and #{@school.postsurveys[0].number_students} students took the post-curriculum surveys."
        @strength_weakness_title = "Strengths and Weaknesses of FM Lessons at #{@school.name}"
        generate_strengths
        generate_weaknesses
      
        @objectives = {
                  "1. Nutrition-related Diseases" => "Discuss the relationship between nutrition and health; teach     students that poor diet choices could lead to obesity, diabetes and heart diseases.",
                  "2. Food Groups" => "Teach students the importance of nutrition by breaking down food groups and basic nutrition terminologies.",
                  "3. Nutrients" => "Discuss the metabolic functions of different nutrients; examine the quantities of fats, sugars, fiber and protein in various types of food.",
                  "4. Nutrition Labeling" => "Teach students how to read and understand food labels to determine which foods are healthier than others. ",
                  "5. Food Advertising " => "Explore the role that advertisements play in influencing consumers\' choice of food; let students know how to make healthy food choices based on knowledge rather than misleading advertisements.",
                  "6. Exercise, Energy and Nutrition" => "Identify the connection between food and energy, and the role that physical activities play in overall health and longevity.",
                   "7. Review lesson" => "Review major concepts covered in the previous lessons. Students are given a chance to practice problem-solving in different scenarios given the knowledge they have in nutrition."  }


        flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"
      else
        flash[:warning] = "#{@school.name} does not have Presurvey Part 1 and 2 or Postsurvey"
        redirect_to new_report_path
      end
    else
      flash[:warning] = "Current user only has access to #{@current_user.school.name}"
      redirect_to new_report_path
    end
  end
  
  def generate_strengths
    @strengths = { 
                   "Q1 Strengths" => "Students could identify factors that may lead to type 2 diabetes",
                   "Q2 Strengths" => "Students understood that poor diet and lack of exercise increase risk for many diseases regardless of one\'s body size.",
                   "Q3 Strengths" => "Students learned the five different food groups included in USDA\'s MyPlate.",
                   "Q4 Strengths" => "Students understood that all five food groups are important to help us achieve a balanced diet.",
                   "Q5 Strengths" => "Students understood that frozen fruits and vegetables are not nutritionally inferior to fresh fruits and vegetables.",
                   "Q6 Strengths" => "Students could recall the numbers of servings one needs for each food group.",
                   "Q7 Strengths" => "Students could recall the different macro- and micronutrients.",
                   "Q8 Strengths" => "Students could distinguish between nutrients.",
                   "Q9 Strengths" => "Students were able to identify foods rich in fiber.",
                   "Q10 Strengths" => "Students understood the difference between healthy and unhealthy fats.",
                   "Q11 Strengths" => "Students understood that vitamins have specific functions in the body.",
                   "Q12 Strengths" => "Students were aware of which nutrients tend to be beneficial, and which nutrients tend to be harmful when consumed in excess.",
                   "Q13 Strengths" => "Students understood that calories are a measure of energy in food.",
                   "Q14 Strengths" => "Students were able to use the nutrition label to identify food products with too much salt.",
                   "Q15 Strengths" => "Students could calculate the numbers of servings in a food package.",
                   "Q16 Strengths" => "Students recognized the goals of food advertisements as well as the techniques that food companies use to promote their products.",
                   "Q17 Strengths" => "Students were able to distinguish between the advertising and factual components on a food package.",
                   "Q18 Strengths" => "Students demonstrated knowledge in the benefits of physical activity.",
                   "Q19 Strengths" => "Students were aware of the recommended amount of exercise.",
                   "Q20 Strengths" => "Students could identify different types of physical activity.",
                   "Q21 Strengths" => "Students understood energy balance and that excess energy can become fat."
                 }
  end

  def generate_weaknesses
    @weaknesses = {
                    "Q1 Weaknesses" => "Students had trouble identifying factors that may lead to type 2 diabetes.",
                    "Q2 Weaknesses" => "Students had trouble understanding that poor diet and lack of exercise increase risk for many diseases regardless of one\'s body size.",
                    "Q3 Weaknesses" => "Students could not recall all five food groups included in USDA\'s MyPlate.",
                    "Q4 Weaknesses" => "Students did not understand that all five food groups are important to help us achieve a balanced diet, even though some food groups should be consumed more than others.",
                    "Q5 Weaknesses" => "Students did not understand that frozen fruits and vegetables are as healthy as fresh fruits and vegetables.",
                    "Q6 Weaknesses" => "Students did not remember the numbers of servings recommended for each food group.",
                    "Q7 Weaknesses" => "Students had trouble recalling nutrients and distinguishing between food groups and nutrients.",
                    "Q8 Weaknesses" => "Students did not completely understand the difference between each nutrient.",
                    "Q9 Weaknesses" => "Students had trouble identifying which foods are rich in fiber.",
                    "Q10 Weaknesses" => "Students did not completely understand that some fats are healthier than others.",
                    "Q11 Weaknesses" => "Students had trouble matching functions to the corresponding vitamins.",
                    "Q12 Weaknesses" => "Students had trouble identifying which nutrients tend to be more beneficial and which tend to be harmful when consumed in excess.",
                    "Q13 Weaknesses" => "Students had trouble interpreting the meaning of a calorie.",
                    "Q14 Weaknesses" => "Students did not understand how to use the nutritional label to identify food products with too much salt.",
                    "Q15 Weaknesses" => "Students had trouble using math to calculate the numbers of servings in a food package.",
                    "Q16 Weaknesses" => "Students had trouble identifying the goals of food advertisements.",
                    "Q17 Weaknesses" => "Students had trouble distinguishing between the advertising and factual components on a food package.",
                    "Q18 Weaknesses" => "Students didn\'t completely understand the benefits of exercise.",
                    "Q19 Weaknesses" => "Students were not able to recall the recommended amount of exercise for children.",
                    "Q20 Weaknesses" => "Students had trouble identifying different types of physical activity.",
                    "Q21 Weaknesses" => "Students did not understand the consequences of consuming excess energy."
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
    @ps = @school.presurveys[1]
    6.times do |i|
       p @efficacy_pre += @ps["section_#{i + 1}"]
    end
    @ps = @school.postsurveys[0]
    @efficacy_post = 0
    21.times do |i|
       p @efficacy_post += @ps["section_#{i + 1}"]
    end
    (@efficacy_post-@efficacy_pre)/@efficacy_pre*100
  end

end
