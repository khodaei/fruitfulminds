require "spec_helper"

describe SessionsController do
  describe "creating session" do
    before :each do
      @fake_user = mock(:id => 1)
      @fake_users = [@fake_user]
    end
    it "should call the model method that gets the user for the specified user_id" do
      User.should_receive(:where).with(:email => "user@fruitfulminds.org").and_return(@fake_users)
      @fake_users.stub(:first).and_return(@fake_user)
      @fake_user.stub(:authenticate).and_return(true)
      post :create, {:user => {:email => "user@fruitfulminds.org", :password => "password"}}
    end
    it "should authenticate the user" do
      User.stub(:where).and_return(@fake_users)
      @fake_users.stub(:first).and_return(@fake_user)
      @fake_user.should_receive(:authenticate).with("password").and_return(true)
      post :create, {:user => {:email => "user@fruitfulminds.org", :password => "password"}}
    end
    it "should set user_id in session and redirect to portal page if user exist" do
      User.stub(:where).and_return(@fake_users)
      @fake_users.stub(:first).and_return(@fake_user)
      @fake_user.stub(:authenticate).and_return(true)
      post :create, {:user => {:email => "user@fruitfulminds.org", :password => "password"}}
      response.should redirect_to(portal_path)
    end
    it "should set notice in flash and redirect to login page" do
      User.stub(:where).and_return(@fake_users)
      @fake_users.stub(:first).and_return(@fake_user)
      @fake_user.stub(:authenticate).and_return(false)
      post :create, {:user => {:email => "user@fruitfulminds.org", :password => "password"}}
      response.should redirect_to(login_path)
    end
  end
  describe "destroying session" do
    it "should redirect to home page" do
      post :destroy
      response.should redirect_to('/')
    end
  end
end
