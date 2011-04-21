Feature: Edit a fueltype
	In order to edit a fueltype
	As an admin
	I have to choose the fueltype, edit the details and save the fueltype
	
	Scenario: Edit a fueltype
		Given I am on admin_fueltypes_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Euro 95'"
		
		#actually edit the fueltype
		When I fill in "fueltype_name" with "Euro 96"
		When I fill in "fueltype_price_per_liter" with "177"
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Euro 95"
		And I should see "Euro 96"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "1.77"
		
	Scenario: Edit a fueltype fails
		Given I am on admin_fueltypes_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Euro 95'"
		
		#actually edit the fueltype
		When I fill in "fueltype_name" with ""
		And I press "Update"
		Then I should see the lightbox
		And I should not see "Euro 96"
		And I should see "1 error prohibited"
		
		When I fill in "fueltype_name" with "Euro 96"
		And I fill in "fueltype_price_per_liter" with "1.6"
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Euro 95"
		And I should see "Euro 96"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "1.60"
		
	Scenario: Edit a fueltype in a slightly different way
		Given I am on admin_fueltypes_path
		When I follow "Show"
		Then I should see the lightbox
		And I wait one second
		When I follow "Edit this fueltype"
		And I wait one second
		Then I should see "Editing 'Euro 95'"
		
		#actually edit the fueltype
		When I fill in "fueltype_name" with "Euro 96"
		And I fill in "fueltype_price_per_liter" with "1"
		And I press "Update"
		Then I should not see the lightbox
		And I should not see "Euro 95"
		And I should see "Euro 96"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "1.00"
		
	Scenario: Cancel editing a fueltype
		Given I am on admin_fueltypes_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Euro 95'"

		#actually cancel the edit action
		When I wait one second
		And I follow "Back"
		Then I should not see the lightbox
		And I should see "Euro 95"
		And I should not see "Euro 96"