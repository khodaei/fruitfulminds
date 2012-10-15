Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(:email => user['email'], :password => user['password'], :name => user['name'], :type => user['type'])
  end
end
