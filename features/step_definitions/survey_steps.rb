Given /the following pre-results exist/ do |results_table|
  results_table.hashes.each do |result|
    Presurvey.create!(result)
  end
end
