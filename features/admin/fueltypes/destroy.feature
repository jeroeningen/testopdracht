Feature: Destroy a fueltype 
	In order to destroy a fueltype
	As an admin
	I should click the destroy link and confirm the destroy
	
	Scenario: Destroy a fueltype
		Given I am on admin_fueltypes_path
		When I confrm the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should not see "Euro 95"
		And I should see "Euro 98"
		And I should see the menu
		
	Scenario: Cancel the destroy
		Given I am on admin_fueltypes_path
		#actually cancel the destroy
		When I cancel the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should see "Euro 95"
		And I should see "Euro 98"
		And I should see the menu
		