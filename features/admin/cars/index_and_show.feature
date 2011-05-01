Feature: Show the first car
	In order to see the first car
	As an admin
	I have to see all cars and click on the show of the first car
	
	Scenario: Show me the first car
		Given I am on admin_cars_path
		And I should see "Listing cars"
		And I should not see the lightbox 
		When I follow "Show"
		Then I should see the lightbox
		And I should see "Ford"
		And I should see "Focus"
		
		#test if the lightbox disappears correctly
		When I wait one second 
		And I follow "Back"
		Then I should not see the lightbox
		
