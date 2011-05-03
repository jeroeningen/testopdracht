Feature: Edit a car
	In order to edit a car
	As an admin
	I have to choose the car, edit the details and save the car
	
	Scenario: Edit a car
		Given I am on admin_cars_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Ford'"
		
		#actually edit the car
		When I fill in "car_brand" with "Ford USA"
		When I fill in "car_price" with "25000,95"
		And I press "Update"
		Then I should not see the lightbox
		And I should see "Ford USA"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "EUR. 25000,95"
		
	Scenario: Edit a car fails
		Given I am on admin_cars_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Ford'"
		
		#actually edit the car
		When I fill in "car_brand" with ""
		When I fill in "car_price" with ""
		And I press "Update"
		Then I should see the lightbox
		And I should not see "Ford USA"
		And I should see "Ford"
		And I should see "2 errors prohibited"
		
		When I fill in "car_brand" with "Ford USA"
		And I fill in "car_price" with "26099,95"
		And I press "Update"
		Then I should not see the lightbox
		And I should see "Ford USA"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "EUR. 26099,95"
		
	Scenario: Edit a car in a slightly different way
		Given I am on admin_cars_path
		When I follow "Show"
		Then I should see the lightbox
		And I wait one second
		When I follow "Edit this car"
		And I wait one second
		Then I should see "Editing 'Ford'"
		
		#actually edit the car
		When I fill in "car_brand" with "Ford USA"
		And I fill in "car_price" with "25096,07"
		And I press "Update"
		Then I should not see the lightbox
		And I should see "Ford USA"
		When I follow "Show"
		Then I should see the lightbox
		And I should see "EUR. 25096,07"
		
	Scenario: Cancel editing a car
		Given I am on admin_cars_path
		When I follow "Edit"
		Then I should see the lightbox
		And I should see "Editing 'Ford'"

		#actually cancel the edit action
		When I wait one second
		And I follow "Back"
		Then I should not see the lightbox
		And I should see "Ford"
		And I should not see "Ford USA"