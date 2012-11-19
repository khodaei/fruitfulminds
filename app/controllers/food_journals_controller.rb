class FoodJournalsController < ApplicationController
  def index
  end

  def new
    @food_journal_main_fields = FoodJournal.new(params[:food_journal])
    @food_journal_week_1_fields = FoodJournal.new(params[:food_journal_week_1_fields])
    @food_journal_week_x_fields = FoodJournal.new(params[:food_journal_week_x_fields])
    @food_journal_week_8_fields = FoodJournal.new(params[:food_journal_week_8_fields])
  end

  def create
    school = School.find(@school)
    begin
      if params[:food_journal][:student_name].empty?
        flash[:warning] = "Student Name cannot be empty."
        redirect_to new_foodjournal_path(:food_journal => params[:food_journal], :food_journal_week_1_fields => params[:food_journal_week_1_fields], :food_journal_week_x_fields => params[:food_journal_week_x_fields], :food_journal_week_8_fields => params[:food_journal_week_8_fields]) and return
      else
        stu_name = params[:food_journal][:student_name]
        week = params[:food_journal][:week_num]
      end

      if not params[:food_journal_week_1_fields].values.all?{|v| v.empty?}
        fj1 = @current_user.food_journals.new
        fj1.school_semester_id = SchoolSemester.find(school)
        fj1.week_num = 1
        fj1.student_name = stu_name
        fj1.update_attributes!(params[:food_journal_week_1_fields])
      end
      if not params[:food_journal_week_x_fields].values.all?{|v| v.empty?}
        fjx = @current_user.food_journals.new
        fjx.school_semester_id = SchoolSemester.find(school)
        fjx.week_num = week
        fjx.student_name = stu_name
        fjx.update_attributes!(params[:food_journal_week_x_fields])
      end
      if not params[:food_journal_week_8_fields].values.all?{|v| v.empty?}
        fj8 = @current_user.food_journals.new
        fj8.school_semester_id = SchoolSemester.find(school)
        fj8.week_num = 8
        fj8.student_name = stu_name
        fj8.update_attributes!(params[:food_journal_week_8_fields])
      end
      flash[:notice] = "Results successfully added."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_foodjournal_path(:food_journal => params[:food_journal], :food_journal_week_1_fields => params[:food_journal_week_1_fields], :food_journal_week_x_fields => params[:food_journal_week_x_fields], :food_journal_week_8_fields => params[:food_journal_week_8_fields])
    end
  end
  
  def edit
    @food_journal_fields = FoodJournal.find(params[:id])
  end

  def update
    begin
      FoodJournal.find(params[:id]).update_attributes!(params[:food_journal])
      flash[:notice] = "Results successfully updated."
      redirect_to portal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to update. Incomplete or has invalid characters."
      redirect_to new_foodjournal_path(:food_journal => params[:food_journal])
    end
  end
end
