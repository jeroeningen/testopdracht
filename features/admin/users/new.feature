Feature: Create a new user
	In order to create a new user
	As a visitor
	I have to fill in the form for a new user and save it
	
	Scenario: Create a new user
		Given I am on admin_users_path
		When I follow "New user"
		Then I should see the lightbox
		And I fill in "user_firstname" with "Frank"
		And I fill in "user_lastname" with "Van Ingen"
		And I fill in "user_street" with "Beemsterstraat 180"
		And I fill in "user_zipcode" with "1024BJ"
		And I fill in "user_city" with "Amsterdam" 
		And Geocoding shows "Nieuwendam"
		
		#actually creates the user
		When I press "Create"
		Then I should not see the lightbox
		And I should see "Frank"	
		
	Scenario: Creation of user fails
		Given I am on admin_users_path
		When I follow "New user"
		Then I should see the lightbox
		And I fill in "user_street" with "Beemsterstraat 180"
		And I fill in "user_zipcode" with "1024BJ"
		And I fill in "user_city" with "Amsterdam" 
		And Geocoding shows "Nieuwendam"
		
		#actually creates the user and it fails
		When I press "Create"
		Then I should see the lightbox
		And I should see "2 errors prohibited"
		And I should not see "Frank"	
		
	Scenario: Cancel creating a user
		Given I am on admin_users_path
		When I follow "New user"
		Then I should see the lightbox
		And I should see "New user"
		
		#actually cancel the creation
		When I follow "Back"
		Then I should not see the lightbox