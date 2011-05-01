Feature: Destroy a car 
	In order to destroy a car
	As an admin
	I should click the destroy link and confirm the destroy
	
	Scenario: Destroy a car
		Given I am on admin_cars_path
		When I confrm the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should not see "Ford"
		And I should see the menu
		
	Scenario: Cancel the destroy
		Given I am on admin_cars_path
		#actually cancel the destroy
		When I cancel the destroy using the confirm dialog
		Then I should not see the lightbox
		And I should see "Ford"
		And I should see the menu
		