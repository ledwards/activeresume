Feature: User registration

	As a user
	I want to sign up and sign in
	So that I can create a resume and portfolio
	
	Scenario: User signs up
		When I go to the new user registration page
		And I fill in "user_email" with "testuser@example.com"
		And I fill in "user_password" with "password"		
		And I fill in "user_password_confirmation" with "password"
		And I press "Sign up"
		Then I should see "You have signed up successfully"		
	
	Scenario: User signs in
		Given a user with email "testuser@example.com" and password "password"
		When I go to the new user session page
		And I fill in "user_email" with "testuser@example.com"
		And I fill in "user_password" with "password"
		And I press "Sign in"
		Then I should see "Welcome"
