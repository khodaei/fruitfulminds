require 'spec_helper'

describe UsersController do
  context "user registration fails due to unsuccessful user object creation in db" do
    before :each do
      @user = {
        :firstname => "Amir",
        :lastname => "Khodaei",
        :college => "Berkeley City",
        :email => "amirk88@gmail.com",
        :password => "password",
        :confirm_password => "password"}
      @school = {
        :name => "Haven's Elementary",
        :city => "Berkeley",
        :county => "Alameda"}
      @semester = {:name => "Fall"}
    end
    it "should set flash warning and redirect to signup page" do
      school = mock('school')
      school.stub(:id).and_return(1)
      school_semesters = mock('school_semester')
      school_semester = mock('school_semester')
      school_semester.stub(:id).and_return(1)
#school_semester.stub(:order).and_return([school_semester])
      profile = mock('profile')
      profile.stub(:id).and_return(2)
      School.stub(:where).and_return([school])
      SchoolSemester.stub(:where).and_return(school_semesters)
      school_semesters.stub(:order).and_return([school_semester])
      Profile.stub(:find_by_label).and_return(profile)
      User.stub(:create).and_return(nil)
# @mock_school.stub(:id).and_return(1)

# @mock_profile.stub(:id).and_return(1)
      post :create, {:user => @user, :school => @school, :semester => @semester, :tos => true}
      flash[:warning].should == "Registration Failed"
      response.should redirect_to(signup_path)
    end
  end
end
