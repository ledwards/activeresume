Given /^a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Factory.create(:user, :email => email, :password => password)
end
