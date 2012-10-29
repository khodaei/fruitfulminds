class FoodJournalsController < ApplicationController
  def index
  end

  def new
    @food_journal_fields = FoodJournal.new(params[:food_journal])
  end

  def create
    school = School.find(@school)
    begin
      fj = @current_user.food_journals.new
      fj.school_info_id = SchoolInfo.find(school)
      fj.update_attributes!(params[:food_journal])
      flash[:notice] = "Results successfully added."
      redirect_to new_foodjournal_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_foodjournal_path(:food_journal => params[:food_journal])
    end
  end
end
