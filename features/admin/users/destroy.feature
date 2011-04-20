Feature: Destroy a user 
	In order to destroy
	As a visitor
	I should click the destroy link and confirm the destroy
	
	Scenario: Destroy a user
		Given I am on admin_users_path
		When I confrm the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should not see "Jeroen"
		And I should see "Rina"
		And I should see the menu
		
	Scenario: Cancel the destroy
		Given I am on admin_users_path
		#actually cancel the destroy
		When I cancel the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should see "Jeroen"
		And I should see "Rina"
		And I should see the menu
		