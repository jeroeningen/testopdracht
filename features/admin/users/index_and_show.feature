Feature: Show the first user
	In order to see the first user
	As a visitor
	I have to see all users, click on the show of the first user and see the details
	
	Scenario: Show me the first user
		Given I am on admin_users_path
		And I uncheck "enable_lightbox"
		And I should see "Listing users"
		And I should not see the lightbox 
		When I follow "Show"
		Then I should not see the lightbox
		And I should see "Show user 'Jeroen Van Ingen'"
		And I should see "Beemsterstraat 176"
		And Geocoding shows "Nieuwendam"
		
		#test if you can go back to the users/index path
		When I follow "Back"
		Then I should not see the lightbox
		And I should be on admin_users_path
		And I should not see "Show user 'Jeroen Van Ingen'"