Given /^a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Factory.create(:user, :email => email, :password => password)
end

Given /^I am a signed in user$/ do
  Factory.create(:user, :password => "password")
  @user = User.last
	visit root_path
	fill_in("user_sign_in_email", :with => @user.email)
	fill_in("user_sign_in_password", :with => "password")
	click_button "Sign in"
end
