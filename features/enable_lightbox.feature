Feature: Enable the lightbox
	In order to enable the lighbox
	As a user 
	I have to check 'enable lightbox' so on every page it is checked
	
	Scenario: Enable the lightbox
		Given I am on the admin homepage
		When I check "enable_lightbox"
		And I follow "Users"
		Then the "enable_lightbox" checkbox should be checked
		When I follow "Home"
		Then the "enable_lightbox" checkbox should be checked
		
	Scenario: Disable the lightbox
		Given I am on the admin homepage
		When the "enable_lightbox" checkbox should not be checked
		And I follow "Users"
		Then the "enable_lightbox" checkbox should not be checked
		When I follow "Home"
		Then the "enable_lightbox" checkbox should not be checked