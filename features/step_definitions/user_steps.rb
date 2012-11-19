Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^the following school_semesters exist/ do |school_semesters_table|
  school_semesters_table.hashes.each do |school_semester|
    SchoolSemester.create!(school_semester)
  end
end

Given /^I fill in all of the registration text fields$/ do
  steps %Q{
    Given I fill in "First Name" with "Amir"
    And I fill in "Last Name" with "Khodaei"
    And I fill in "Email Address" with "amirk88@gmail.com"
    And I fill in "College" with "Berkeley City College"
    And I fill in "School Name" with "school1"
    And I fill in "School County" with "Alameda"
    And I fill in "School City" with "Berkeley"
    And I select "Fall" from "Survey Period"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "password"
  }
end

Given /^I fill in all registration fields except password fields$/ do
  steps %Q{
    Given I fill in "First Name" with "Amir"
    And I fill in "Last Name" with "Khodaei"
    And I fill in "Email Address" with "amirk88@gmail.com"
    And I fill in "College" with "Berkeley City College"
    And I fill in "School Name" with "school1"
    And I fill in "School County" with "Alameda"
    And I fill in "School City" with "Berkeley"
    And I select "Fall" from "Survey Period"
  }
end

Given /^"(.*)" is a pending user$/ do |name|
  PendingUser.create!(:user_id => User.find_by_name(name).id)
end

Given /^I am logged in as "(.*)" with "(.*)" as my password$/ do |email, password|
  steps %Q{
    Given I am on the login page
    And I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I press "Sign In"
  }
end

Given /^I (dis)?approve "(.*)"$/ do |dis,name|
  if dis
    step %Q{I check "disapproves[#{User.find_by_name(name).id}]"}
  else
    step %Q{I check "approves[#{User.find_by_name(name).id}]"}
  end
end

#Given /^I fill in full name, email and passwords with: "(.*)", "(.*)", "(.*)", "(.*)"$/ do |name, email, pass, conf_pass|
#  steps %Q{
#    Given I fill in "Full Name" with "#{name}"
#    And I fill in email and passwords with: "#{email}", "#{pass}", "#{conf_pass}"
#  }
#end
#
Given /^I fill in email and passwords with: "(.*)", "(.*)", "(.*)"$/ do |email, pass, conf_pass|
  steps %Q{
    Given I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{pass}"
    And I fill in "Confirm Password" with "#{conf_pass}"
  }
end
