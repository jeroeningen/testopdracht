Feature: Destroy a user
	In order to destroy a user
	As a visitor
	I should click the destroy link and confirm the destroy
	
	Scenario: Destroy a user
		Given I am on users_path
		When I follow "Destroy"
		Then I should see the fancybox
		
		#actually do the destroy
		When I press "Yes"
		Then I should not see the fancybox
		And I should not see "Jeroen"
		
	Scenario: Cancel the destroy
		Given I am on users_path
		When I follow "Destroy"
		Then I should see the fancybox
		
		#actually cancel the destroy
		When I press "No"
		Then I should not see the fancybox
		And I should see "Jeroen"
		