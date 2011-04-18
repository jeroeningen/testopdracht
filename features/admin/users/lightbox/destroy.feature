Feature: Destroy a user using the lightbox
	In order to destroy a user using the lightbox
	As a visitor
	I should click the destroy link and confirm the destroy in the lightbox
	
	Scenario: Destroy a user when using the lightbox
		Given I am on admin_users_path
		And I check "enable_lightbox"
		And I wait one second
		When I follow "Destroy"
		Then I should see the lightbox
		
		#actually do the destroy
		When I press "Yes"
		Then I should not see the lightbox
		And I should not see "Jeroen"
		
	Scenario: Cancel the destroy when using the lightbox
		Given I am on admin_users_path
		And I check "enable_lightbox"
		And I wait one second
		When I follow "Destroy"
		Then I should see the lightbox
		
		#actually cancel the destroy
		When I press "No"
		Then I should not see the lightbox
		And I should see "Jeroen"
		