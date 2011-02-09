Feature: Publications

	As a user
	I want to manage my publications
	So that I can share information about my publications on my resume 
	
	Scenario: User creates publication
		Given I am a signed in user
		When I go to the dashboard page
		And I follow "Add publication history"
		And I fill in "Title" with "1984"
		And I fill in "Author" with "Lee Edwards and George Orwell"
		And I fill in "Publication date" with "Jan. 1955"
		And I fill in "Publisher" with "Penguin Books"
		And I fill in "Description" with "Just a little book I wrote with a friend of mine"
		And I fill in "Hyperlink" with "http://www.georgeorwell.com"
		And I press "Save"
		Then I should see "1984" within "#resume_preview"
