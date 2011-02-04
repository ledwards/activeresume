Feature: User profile

	As a user
	I want to manage my profile
	So that I can give my personal information on my resume
	
	Scenario: User creates first education record
		Given I am a signed in user
		When I go to the dashboard page
		And I follow "Edit personal information"
		And I fill in "First name" with "Lee"
		And I fill in "Last name" with "Edwards"
		And I fill in "Middle name" with "Robertson"
		And I fill in "Address line 1" with "568 Pacific St. #5B"
		And I fill in "Address line 2" with ""
		And I fill in "City" with "Brooklyn"
		And I fill in "State" with "NY"
		And I fill in "Zip code" with "11217"
		And I fill in "Phone" with "781.738.6359"
		And I fill in "Email" with "leeredwards@gmail.com"
		And I fill in "Website" with "http://ledwards.com"
		And I press "Save"
		Then I should see "Lee" within "#resume_preview"