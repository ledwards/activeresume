Feature: Education history

	As a user
	I want to manage my education records
	So that I can track my education history on my resume
	
	Scenario: User creates first education record
		Given I am a signed in user
		When I go to the dashboard page
		And I follow "Add education history"
		And I fill in "Major" with "B.S. Engineering Systems Design"
		And I fill in "Institution name" with "Franklin W. Olin College of Engineering"
		And I fill in "Location" with "Needham, MA"
		And I select "October" from "Start month"
		And I select "2010" from "Start year"
		And I fill in "Summary" with "I got straight A's and was totally awesome."
		And I press "Save"
		Then I should see "Olin College" within "#resume"
	
	@javascript
	Scenario: User creates second education record
		Given I am a signed in user
		And I have a current education record
		When I go to the dashboard page
		And I follow "Add education history"
		And I fill in "Major" with "B.S. Systems Engineering"
		And I fill in "Institution name" with "Worcester Polytechnic Institute"
		And I fill in "Location" with "Bedford, MA"
		And I select "October" from "Start month"
		And I select "2007" from "Start year"
		And I uncheck "Still at this job?"
		And I select "September" from "Start month"
		And I select "2010" from "Start year"
		And I fill in "Summary" with "Big old college description."
		And I press "Save"
		Then I should see "Worcester Polytechnic Institute" within "#resume"