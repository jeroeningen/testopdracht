Feature: Show the first user
	In order to see the first user
	As an admin
	I have to see all users and click on the show of the first user
	
	Scenario: Show me the first user
		Given I am on admin_users_path
		And I should see "Listing users"
		And I should not see the lightbox 
		When I follow "Show"
		Then I should see the lightbox
		And I should see "Jeroen Van Ingen"
		And I should see "Beemsterstraat 176"
		And Geocoding shows "Nieuwendam"
		
		#test if the lightbox disappears correctly
		When I wait one second 
		And I follow "Back"
		Then I should not see the lightbox
		
