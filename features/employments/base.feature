Feature: Employment history

	As a user
	I want to manage my employment records
	So that I can track my employment history on my resume
	
	Scenario: User creates first employment record
		Given I am a signed in user
		When I go to the dashboard page
		And I follow "Add employment history"
		And I fill in "Job title" with "Software Engineer"
		And I fill in "Company name" with "Pivotal Labs, Inc."
		And I fill in "Location" with "New York, NY"
		And I select "October" from "Start month"
		And I select "2010" from "Start year"
		And I fill in "Summary" with "Big old job description."
		And I press "Save"
		Then I should see "Pivotal Labs" within "#resume"
	
	@javascript
	Scenario: User creates second employment record
		Given I am a signed in user
		And I have a current employment record
		When I go to the dashboard page
		And I follow "Add employment history"
		And I fill in "Job title" with "Mechanical Engineer"
		And I fill in "Company name" with "iRobot Corporation"
		And I fill in "Location" with "Bedford, MA"
		And I select "October" from "Start month"
		And I select "2007" from "Start year"
		And I uncheck "Still at this job?"
		And I select "September" from "Start month"
		And I select "2010" from "Start year"
		And I fill in "Summary" with "Big old job description."
		And I press "Save"
		Then I should see "iRobot" within "#resume"