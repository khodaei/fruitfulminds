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

Given /\s*I am logged in as amir$/ do
  steps %Q{
And I am on the login page
And I fill in "Email" with "amirk88@gmail.com"
And I fill in "Pass" with "123f5"
And I press "Sign In"}
end

Given /\s*I am logged in as john$/ do
  steps %Q{
And I am on the login page
And I fill in "Email" with "john@gmail.com"
And I fill in "Pass" with "12345"
And I press "Sign In"}
end
