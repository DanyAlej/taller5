Feature: Show information about the stations  by a given name 


	Scenario: As a user I want to see the detail of the main routes offered by the app at the general view
		Given I press "Paraderos"
		#button to remove the splash screen
		When I press "Paraderos"
		And I wait
		And I press "Paraderos"	
		And I press "C"
		Then I should see "7"
		And I should see "B50"
		And I should see "C15"
		And I should see "c50"

	Scenario: As a user I want to see the detail of the main routes offered by the app when I click Transmilenio
		Given I press "Paraderos"
		#button to remove the splash screen
		When I press "Paraderos"
		And I press "TRANSMILENIO"
		And I press "C"
		Then I should see "7"
		And I should see "B50"
		And I should see "C15"
		And I should see "c50"

	Scenario: As a user I want to see the detail of the main routes offerde by the app when clicking SITP
		Given I press "Paraderos"
		#button to remove the splash screen
		When I press "Paraderos"
		And I press "SITP"
		And I press "AC 100"
		Then I should see "107B"
		And I should see "270"
		And I should see "291"
		And I should see "341"
