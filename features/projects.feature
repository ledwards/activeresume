Feature: Projects

	As a user
	I want to create a project
	So that I can manage and share my projects
	
	Scenario: User creates a current project
		Given I am a signed in user
		When I go to the dashboard page
		And I follow "Add project"
		And I fill in "Title" with "ActiveResume"
		And I fill in "Institution name" with "Pivotal Labs"
		And I fill in "Location" with "Needham, MA"
		And I fill in "Description" with "I made this cool app with David from Olin"
		And I select "October" from "Start month"
		And I select "2010" from "Start year"
		And I check "Still working on this project?"
		And I fill in "Hyperlink" with "http://www.activeresu.me"
		And I attach the file at "spec/fixtures/sample.png" to "project_image"
		And I press "Save"
		Then I should see "ActiveResume" within "#resume_preview"
