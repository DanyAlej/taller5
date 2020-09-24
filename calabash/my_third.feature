 
Feature: Plan a trip.

  Scenario: As a user I want to be able to plan a trip in Transmilenio
    Given I press "Planear viaje en Transmi o SITP"               
    When I press "Punto de destino"
    And I enter text "universidad nacional" into "Busca paradero de destino"
    Then I should see the text containing "NQS / Cll. 45A y Cll. 48"
    Then I clear "Punto de destino"
    Then I should see "Seleccionar sitio en el mapa"
  
  Scenario: As a user I want to be able to see all Troncales and the detail of one Troncal
    Given I press "Planear viaje en Transmi o SITP"              
    When I press "TRONCALES"
    And I scroll down
    Then I should see "Calle 26'
    Then I press "Calle 26"
    Then I see "Centro Memoria"

  Scenario: As a user I want to be able to see SITP options
    Given I press "Planear viaje en Transmi o SITP"              
    When I press "SITP"
    Then I should see "MAPS"
    Then I should not see "TRONCALES"
    Then I should not see "MAPA SISTEMA"
