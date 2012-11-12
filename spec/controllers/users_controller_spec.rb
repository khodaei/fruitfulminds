require 'spec_helper'

describe UsersController do
  context "user registration fails due to unsuccessful user object creation in db" do
    before :each do
      @user = {
        :name => "user",
        :email => "user@domain.com",
        :password => "password",
        :confirm_password => "password"}
    end
    it "should set flash warning and redirect to signup page" do
      Profile.stub(:find_by_label).and_return(@mock)
      @mock_profile.stub(:id).and_return(1)
      User.stub(:create).and_return(nil)
      post :create, {:user => @user, :tos => true}
      flash[:warning].should == "Registration Failed"
      response.should redirect_to(signup_path)
    end
  end
end
