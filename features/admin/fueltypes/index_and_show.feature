Feature: Show me the first fueltype
	In order to show the first fueltype
	As an admin
	I have to go the the fueltype admin index and click on the show-link
	
	Scenario: Show me the first fueltype
		Given I am on admin_fueltypes_path
		Then I should see "Euro 95"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "Show fueltype 'Euro 95'"
		And I should see "Name"
		And I should see "Price per liter"
		
		#test if the lightbox disappears correctly
		When I follow "Back"
		Then I should not see the lightbox