require 'spec_helper'

describe PresurveysController do
  describe 'editing survey' do
    before :each do
      @mock_user = mock(:school => 1)
      User.stub(:find_by_id).and_return(@mock_user)
    end
    it 'should redirect to login page' do
      @mock_user = mock(:school => 1)
      User.stub(:find_by_id).and_return(nil)
      post :edit
      response.should redirect_to(login_path)
    end
    it 'should call model method' do
      @mock_survey = mock("survey")
      Presurvey.should_receive(:find).with("1").and_return(@mock_survey)
      post :edit, {:id => "1"}
      assigns(:presurvey_fields).should == @mock_survey
    end
  end
  describe 'updating survey' do
    before :each do
      @mock_user = mock(:school => 1)
      User.stub(:find_by_id).and_return(@mock_user)
    end
    it 'should call model method' do
      @mock_survey = mock("survey")
      Presurvey.should_receive(:find).with("1").and_return(@mock_survey)
      @mock_survey.stub(:update_attributes!).and_return(true)
      post :update, {:id => "1"}
    end
#      User.stub(:find_by_id).and_return(nil)
#     post :current_user
#      response.should redirect_to login_path
#    end
  end
end
