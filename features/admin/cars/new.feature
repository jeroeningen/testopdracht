Feature: Create a new car
	In order to create a new car
	As an admin
	I have to fill in the form for a new car and save it
	
	Scenario: Create a new car
		Given I am on admin_cars_path
		When I follow "New car"
		Then I should see the lightbox
		And I fill in "car_brand" with "Toyota"
		And I fill in "car_model" with "Prius"
		And I fill in "car_price" with "21000,95"
		And I select "Sedan" from "car_cartype"
		
		#actually creates the car
		When I press "Create"
		Then I should not see the lightbox
		And I should see "Toyota"
		
	Scenario: Creation of car fails
		Given I am on admin_cars_path
		When I follow "New car"
		Then I should see the lightbox
		And I fill in "car_price" with "1.10"
		
		#actually creates the car and it fails
		When I press "Create"
		Then I should see the lightbox
		And I should see "3 errors prohibited"
		And I should not see "Diesel"	
		
	Scenario: Cancel creating a car
		Given I am on admin_cars_path
		When I follow "New car"
		Then I should see the lightbox
		And I should see "New car"
		
		#actually cancel the creation
		When I follow "Back"
		Then I should not see the lightbox