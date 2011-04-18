Feature: Show the first user in the lightbox
	In order to see the first user in the lightbox
	As a visitor
	I have to see all users, click on the show of the first user and see the details in the lightbox
	
	Scenario: Show me the first user in the lightbox
		Given I am on admin_users_path
		And I check "enable_lightbox"
		And I should see "Listing users"
		And I should not see the lightbox 
		When I follow "Show"
		Then I should see the lightbox
		And I should see "Show user 'Jeroen Van Ingen'"
		And I should see "Beemsterstraat 176"
		And Geocoding shows "Nieuwendam"
		
		#test if the fancybox disappears correctly
		When I wait one second 
		And I follow "Back"
		Then I should not see the lightbox
		And I should be on admin_users_path
		
