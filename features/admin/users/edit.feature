Feature: Edit a user
	In order to edit a user
	As a visitor
	I have to choose the user, edit the details and save the user
	
	Scenario: Edit a user
		Given I am on admin_users_path
		And I uncheck "enable_lightbox"
		When I follow "Edit"
		Then I should not see the lightbox
		And I should see "Editing 'Jeroen Van Ingen'"
		And Geocoding shows "Nieuwendam"
		
		#actually edit the user
		When I fill in "user_firstname" with "Willem"
		And I fill in "user_zipcode" with "1093SR"
		And I fill in "user_street" with "Beemsterstraat 182"
		And Geocoding shows "Weesperzijde"
		
		#actually update the user
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Jeroen"
		And I should see "Willem"
		And I should see "Listing users"
		And I should be on admin_users_path
		
	Scenario: Edit a user fails
		Given I am on admin_users_path
		And I uncheck "enable_lightbox"
		When I follow "Edit"
		Then I should not see the lightbox
		And I should see "Editing 'Jeroen Van Ingen'"
		And Geocoding shows "Nieuwendam"
		
		#actually edit the user
		When I fill in "user_firstname" with ""
		And I fill in "user_zipcode" with "1093SR"
		And I fill in "user_street" with "Beemsterstraat 182"
		And Geocoding shows "Weesperzijde"
		
		#actually update the user
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Willem"
		And I should see "1 error prohibited"
		And I should see "Editing 'Van Ingen'"
		
	Scenario: Edit a user in a slightly different way when using the lightbox
		Given I am on admin_users_path
		And I uncheck "enable_lightbox"
		When I follow "Show"
		Then I should not see the lightbox
		When I follow "Edit this user"
		Then I should see "Editing 'Jeroen Van Ingen'"
		And Geocoding shows "Nieuwendam"
		
		#actually edit the user
		When I fill in "user_firstname" with "Willem"
		And I fill in "user_zipcode" with "1093SR"
		And I fill in "user_street" with "Beemsterstraat 182"
		And Geocoding shows "Weesperzijde"
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Jeroen"
		And I should see "Willem"
		And I should see "Listing users"
		And I should be on admin_users_path
		
	Scenario: Cancel editing a user when using the lightbox
		Given I am on admin_users_path
		And I uncheck "enable_lightbox"
		When I follow "Edit"
		Then I should not see the lightbox
		And I should see "Editing 'Jeroen Van Ingen'"
		And Geocoding shows "Nieuwendam"
		
		#actually cancel the edit action
		When I follow "Back"
		Then I should not see the lightbox
		And I should see "Jeroen"
		And I should not see "Willem"
		And I should see "Listing users"
		And I should be on admin_users_path