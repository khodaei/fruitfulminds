Given /the following pre-results exist/ do |results_table|
  results_table.hashes.each do |result|
    Presurvey.create!(result)
  end
end

Given /the following post-results exist/ do |results_table|
  results_table.hashes.each do |result|
    Postsurvey.create!(result)
  end
end

Given /the following schools exist/ do |results_table|
  results_table.hashes.each do |result|
    School.create!(result)
  end
end

Then /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end 

Given /\s*I am logged in$/ do
  steps %Q{
And I am on the login page
And I fill in "Email" with "amirk88@gmail.com"
And I fill in "Pass" with "123f5"
And I press "Sign In"}
end
