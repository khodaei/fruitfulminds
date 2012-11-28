class ReportsController < ApplicationController
  def new
    @schools = @current_user.schools
  end

  def create
    @school_semester = @current_user.school_semester
    @schools = @current_user.schools
    @school = School.find_by_id(params[:school])

    if @schools.include?(@school)
      if @school.has_all_report_data
        @report = Report.create!(:school_semester_id => @school_semester.id)
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
        @school_intro = "Fruitful Minds held a nutrition lesson series at #{@school.name} during #{@school_semester.name} #{@school_semester.year}" 
        @school_intro_second = "    #{@school.users.size} students from UC Berkeley #{@ambassadors} were selected as Fruitful Minds ambassadors"    
        @school_intro_third = "    During each 50-minute lesson, class facilitators delivered the cirriculum material through lectures, games, and various interactive activities."
        @eval_intro_first = "Prior to the 7-week curriculum, a pre-curriculum survey was distributed to assess the students\' knowledge in nutrition; a very similar survey was administered during the final class. The goal of the surveys was to determine the retention of key learning objectives from the Fruitful Minds program."
        @efficacy = calculate_efficacy
        @eval_intro_second = "On average, students have shown a #{@efficacy}% improvement after going through seven weeks of classes." 
        @eval_intro_third = "The survey results are shown below. The first graph shows the average scores in each of the six nutrition topics covered in the curriculum (see graph 1). Note that the number of questions in each category varies. The second graph shows students\' overall performance on the pre-curriculum surveys and post-curriculum survey (see graph 2). #{@school_semester.presurvey_part1s[0].number_students} took the pre-curriculum survey, and #{@school_semester.postsurveys[0].number_students} students took the post-curriculum surveys."
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

                   
        @ambassadorNoteTitle = "Ambassador Notes: "
        
        flash[:notice] = "Report generated successfully for #{School.find(params[:school]).name}"

      else
        flash[:warning] = "Not enough data available to generate a report for '#{@school.name}' school" # to createdoes not have Presurvey Part 1 and 2 or Postsurvey"
        redirect_to new_report_path
      end
    else
      flash[:warning] = "Current user only has access to #{@current_user.school.name}"
      redirect_to new_report_path
    end
  end

  def generate_strengths
    @all_strengths = { 
                   "S1Q1 Strengths" => "Students could identify factors that may lead to type 2 diabetes",
                   "S1Q2 Strengths" => "Students understood that poor diet and lack of exercise increase risk for many diseases regardless of one\'s body size.",
                   "S2Q1 Strengths" => "Students learned the five different food groups included in USDA\'s MyPlate.",
                   "S2Q2 Strengths" => "Students understood that all five food groups are important to help us achieve a balanced diet.",
                   "S2Q3 Strengths" => "Students understood that frozen fruits and vegetables are not nutritionally inferior to fresh fruits and vegetables.",
                   "S2Q4 Strengths" => "Students could recall the numbers of servings one needs for each food group.",
                   "S3Q1 Strengths" => "Students could recall the different macro- and micronutrients.",
                   "S3Q2 Strengths" => "Students could distinguish between nutrients.",
                   "S3Q3 Strengths" => "Students were able to identify foods rich in fiber.",
                   "S3Q4 Strengths" => "Students understood the difference between healthy and unhealthy fats.",
                   "S3Q5 Strengths" => "Students understood that vitamins have specific functions in the body.",
                   "S3Q6 Strengths" => "Students were aware of which nutrients tend to be beneficial, and which nutrients tend to be harmful when consumed in excess.",
                   "S4Q1 Strengths" => "Students understood that calories are a measure of energy in food.",
                   "S4Q2 Strengths" => "Students were able to use the nutrition label to identify food products with too much salt.",
                   "S4Q3 Strengths" => "Students could calculate the numbers of servings in a food package.",
                   "S5Q1 Strengths" => "Students recognized the goals of food advertisements as well as the techniques that food companies use to promote their products.",
                   "S5Q2 Strengths" => "Students were able to distinguish between the advertising and factual components on a food package.",
                   "S6Q1 Strengths" => "Students demonstrated knowledge in the benefits of physical activity.",
                   "S6Q2 Strengths" => "Students were aware of the recommended amount of exercise.",
                   "S6Q3 Strengths" => "Students could identify different types of physical activity.",
                   "S6Q4 Strengths" => "Students understood energy balance and that excess energy can become fat."
                 }
    section_and_num_questions = {1 => 2, 2 => 4, 3 => 6, 4 => 3, 5 => 2, 6 => 4}
    @ps = @school_semester.postsurveys[0]
    @strengths = {}
    section_and_num_questions.each do |section,questions|
      questions.times do |i|
        @efficacy_post = @ps["section_#{section}_#{i + 1}"]
        if @efficacy_post*1.0/@ps.number_students > 0.80
          @strengths["S#{section}Q#{i + 1} Strengths"] = @all_strengths["S#{section}Q#{i + 1} Strengths"]
        end
      end
    end
    @strengths
  end

  def generate_weaknesses
    @all_weaknesses = {
                    "S1Q1 Weakness" => "Students had trouble identifying factors that may lead to type 2 diabetes.",
                    "S1Q2 Weaknesses" => "Students had trouble understanding that poor diet and lack of exercise increase risk for many diseases regardless of one\'s body size.",
                    "S2Q1 Weaknesses" => "Students could not recall all five food groups included in USDA\'s MyPlate.",
                    "S2Q2 Weaknesses" => "Students did not understand that all five food groups are important to help us achieve a balanced diet, even though some food groups should be consumed more than others.",
                    "S2Q3 Weaknesses" => "Students did not understand that frozen fruits and vegetables are as healthy as fresh fruits and vegetables.",
                    "S2Q4 Weaknesses" => "Students did not remember the numbers of servings recommended for each food group.",
                    "S3Q1 Weaknesses" => "Students had trouble recalling nutrients and distinguishing between food groups and nutrients.",
                    "S3Q2 Weaknesses" => "Students did not completely understand the difference between each nutrient.",
                    "S3Q3 Weaknesses" => "Students had trouble identifying which foods are rich in fiber.",
                    "S3Q4 Weaknesses" => "Students did not completely understand that some fats are healthier than others.",
                    "S3Q5 Weaknesses" => "Students had trouble matching functions to the corresponding vitamins.",
                    "S3Q6 Weaknesses" => "Students had trouble identifying which nutrients tend to be more beneficial and which tend to be harmful when consumed in excess.",
                    "S4Q1 Weaknesses" => "Students had trouble interpreting the meaning of a calorie.",
                    "S4Q2 Weaknesses" => "Students did not understand how to use the nutritional label to identify food products with too much salt.",
                    "S4Q3 Weaknesses" => "Students had trouble using math to calculate the numbers of servings in a food package.",
                    "S5Q1 Weaknesses" => "Students had trouble identifying the goals of food advertisements.",
                    "S5Q2 Weaknesses" => "Students had trouble distinguishing between the advertising and factual components on a food package.",
                    "S6Q1 Weaknesses" => "Students didn\'t completely understand the benefits of exercise.",
                    "S6Q2 Weaknesses" => "Students were not able to recall the recommended amount of exercise for children.",
                    "S6Q3 Weaknesses" => "Students had trouble identifying different types of physical activity.",
                    "S6Q4 Weaknesses" => "Students did not understand the consequences of consuming excess energy."
                  }

  section_and_num_questions = {1 => 2, 2 => 4, 3 => 6, 4 => 3, 5 => 2, 6 => 4}
    @ps = @school_semester.postsurveys[0]
    @weaknesses = {}
    section_and_num_questions.each do |section,questions|
      questions.times do |i|
        @efficacy_post = @ps["section_#{section}_#{i + 1}"]
        if @efficacy_post*1.0/@ps.number_students < 0.50
          @weaknesses["S#{section}Q#{i + 1} Weaknesses"] = @all_weaknesses["S#{section}Q#{i + 1} Weaknesses"]
        end
      end
    end
    return @weaknesses
  end


  def generate_pdf
    @report = Report.find_by_id(params[:report][:id])
    @school = School.find_by_id(params[:school][:id])

    if not params[:amb_note].blank?
      #puts ">> #{params[:amb_note]} <<"
      @reportNote = params[:amb_note]
      #puts @reportNote
      #if @report.save
        # logic for generating the pdf
        # save the pdf in database
        # generate a link for downloading the pdf
        show

        redirect_to "/reports/#{@fileName}"
        return
      #end
    end

    flash[:warning] = "Could not generate the PDF report"
    redirect_to new_report_path and return
  end
  
  
  def show

    @reportNote3 = "#{@reportNote}"
    schoolName = @school.name
    schoolName.gsub! /\s+/, '_'
    schoolName = schoolName.downcase
    @fileName = "#{schoolName}_report.pdf"

    @school_semester = @current_user.school_semester
    schoolName.gsub!(/_/, ' ')    
    @school.name.gsub!(/_/, ' ')

    @main_title = "Fruitful Minds #{@school.name} Fall 2012 Report"
    @school_intro_title = "Fruitful Minds at #{@school.name}"
    @school_intro = "Fruitful Minds held a nutrition lesson series at #{@school.name} during #{@school_semester.name} #{@school_semester.year}" 
    @school_intro_second = "    #{@school.users.size} students from UC Berkeley #{@ambassadors} were selected as Fruitful Minds ambassadors"    
    @school_intro_third = "    During each 50-minute lesson, class facilitators delivered the cirriculum material through lectures, games, and various interactive activities."
    @eval_intro_first = "Prior to the 7-week curriculum, a pre-curriculum survey was distributed to assess the students\' knowledge in nutrition; a very similar survey was administered during the final class. The goal of the surveys was to determine the retention of key learning objectives from the Fruitful Minds program."
    @efficacy = calculate_efficacy
    @eval_intro_second = "On average, students have shown a #{@efficacy}% improvement after going through seven weeks of classes." 
    @eval_intro_third = "The survey results are shown below. The first graph shows the average scores in each of the six nutrition topics covered in the curriculum (see graph 1). Note that the number of questions in each category varies. The second graph shows students\' overall performance on the pre-curriculum surveys and post-curriculum survey (see graph 2). 16 students took the pre-curriculum survey, and 11 students took the post-curriculum surveys."
    @strength_weakness_title = "Strengths and Weaknesses of FM Lessons at #{@school.name}"
    @static_contents = StaticContent.first
    generate_strengths
    generate_weaknesses
    @ambassadorNoteTitle = "Ambassador Notes: "

    @objectives = {
                  "1. Nutrition-related Diseases" => "Discuss the relationship between nutrition and health; teach     students that poor diet choices could lead to obesity, diabetes and heart diseases.",
                  "2. Food Groups" => "Teach students the importance of nutrition by breaking down food groups and basic nutrition terminologies.",
                  "3. Nutrients" => "Discuss the metabolic functions of different nutrients; examine the quantities of fats, sugars, fiber and protein in various types of food.",
                  "4. Nutrition Labeling" => "Teach students how to read and understand food labels to determine which foods are healthier than others. ",
                  "5. Food Advertising " => "Explore the role that advertisements play in influencing consumers\' choice of food; let students know how to make healthy food choices based on knowledge rather than misleading advertisements.",
                  "6. Exercise, Energy and Nutrition" => "Identify the connection between food and energy, and the role that physical activities play in overall health and longevity.",
                   "7. Review lesson" => "Review major concepts covered in the previous lessons. Students are given a chance to practice problem-solving in different scenarios given the knowledge they have in nutrition."  }
    
    #@objectivesTable = [["Lessons", "Objectives"]]
    
    @objectivesTable = @objectives.map do |item1, item2|
      [
      item1, item2
      ]
    end

    #puts @objectivesTable
    #puts @ambassadorNote
    #puts @reportNote3

    
  end
  

  def calculate_efficacy
    section_and_num_questions = {1 => 2, 2 => 4, 3 => 6, 4 => 3}
    @efficacy_pre = 0
    @ps_part1 = @school_semester.presurvey_part1s[0]
    section_and_num_questions.each do |section,questions|
      questions.times do |i|
        @efficacy_pre += @ps_part1["section_#{section}_#{i + 1}"]
      end
    end
    if @ps_part1.number_students != 0
      @efficacy_pre = @efficacy_pre*1.0/@ps_part1.number_students
    end
    section_and_num_questions = {5 => 2, 6 => 4}
    @ps_part2 = @school_semester.presurvey_part2s[0]
    @efficacy_pre2 = 0
    section_and_num_questions.each do |section,questions|
      questions.times do |i|
        if !(@ps_part2["section_#{section}_#{i + 1}"]).nil?
        @efficacy_pre2 += @ps_part2["section_#{section}_#{i + 1}"]
        end
      end
    end
    if @ps_part2.number_students != 0
      @efficacy_pre2 = @efficacy_pre2*1.0/@ps_part2.number_students
    end
    @efficacy_pre = (@efficacy_pre + @efficacy_pre2)/21.0
    #p @efficacy_pre
    section_and_num_questions = {1 => 2, 2 => 4, 3 => 6, 4 => 3, 5 => 2, 6 => 4}
    @ps = @school_semester.postsurveys[0]
    @efficacy_post = 0
    section_and_num_questions.each do |section,questions|
      questions.times do |i|
        @efficacy_post += @ps["section_#{section}_#{i + 1}"]
      end
    end
    if @ps.number_students != 0
      @efficacy_post = (@efficacy_post*1.0/@ps.number_students)/21.0
      #p @efficacy_post
    end
    if @efficacy_pre != 0
      return ((@efficacy_post-@efficacy_pre)*100.0/@efficacy_pre).round 2
    end
  end

end
