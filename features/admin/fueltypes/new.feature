Feature: Create a new fueltype
	In order to create a new fueltype
	As an admin
	I have to fill in the form for a new fueltype and save it
	
	Scenario: Create a new fueltype
		Given I am on admin_fueltypes_path
		When I follow "New fueltype"
		Then I should see the lightbox
		And I fill in "fueltype_name" with "Diesel"
		And I fill in "fueltype_price_per_liter" with "1.23"
		
		#actually creates the fueltype
		When I press "Create"
		Then I should not see the lightbox
		And I should see "Diesel"
		
	Scenario: Creation of fueltype fails
		Given I am on admin_fueltypes_path
		When I follow "New fueltype"
		Then I should see the lightbox
		And I fill in "fueltype_price_per_liter" with "1.10"
		
		#actually creates the fueltype and it fails
		When I press "Create"
		Then I should see the lightbox
		And I should see "1 error prohibited"
		And I should not see "Diesel"	
		
	Scenario: Cancel creating a fueltype
		Given I am on admin_fueltypes_path
		When I follow "New fueltype"
		Then I should see the lightbox
		And I should see "New fueltype"
		
		#actually cancel the creation
		When I follow "Back"
		Then I should not see the lightbox