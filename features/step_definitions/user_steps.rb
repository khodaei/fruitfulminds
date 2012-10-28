Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^I fill in full name, email and passwords with: "(.*)", "(.*)", "(.*)", "(.*)"$/ do |name, email, pass, conf_pass|
  steps %Q{
    Given I fill in "Full Name" with "#{name}"
    And I fill in email and passwords with: "#{email}", "#{pass}", "#{conf_pass}"
  }
end

Given /^I fill in email and passwords with: "(.*)", "(.*)", "(.*)"$/ do |email, pass, conf_pass|
  steps %Q{
    Given I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{pass}"
    And I fill in "Confirm Password" with "#{conf_pass}"
  }
end
