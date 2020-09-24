Feature: Registering into losestudiantes
    As an user I want to create an account in losestudiantes

Scenario Outline: Registration failed with existing email

  Given I go to losestudiantes home screen
    When I open the 'ingresar' screen
    And Put input with <name> with <lastname> with <email> with <university> with <maestria> with <undergrad> with <password> and <conditions>
    And I try to register
    Then I expect to see popup <error>

    Examples:
      | name             | lastname | email             | university               | maestria | undergrad      | password   | conditions | error    | 
      | dany             | dany     | dany@gmail.com    | Universidad de los Andes | no       | Administración | dany123456 | yes        | "Error: Ya existe un usuario"  |

Scenario Outline: Registration failed password too short 

  Given I go to losestudiantes home screen
    When I open the 'ingresar' screen
    And Put input with <name> with <lastname> with <email> with <university> with <maestria> with <undergrad> with <password> and <conditions>
    And I try to register
    Then I expect to see <error>

    Examples:
      | name             | lastname | email             | university               | maestria | undergrad      | password   | conditions | error    |
      | dany             | dany     | dany@gmail.com    | Universidad de los Andes | no       | Administración | day6       | yes        | "debe ser al menos"  |


Scenario Outline: Registration failed empty fields 

  Given I go to losestudiantes home screen
    When I open the 'ingresar' screen
    And Put input with <name> with <lastname> with <email> with <university> with <maestria> with <undergrad> with <password> and <conditions>
    And I try to register
    Then I expect to see <error>

    Examples:
      | name             | lastname | email             | university               | maestria | undergrad      | password   | conditions | error    |
      | dany             | dany     |                   | Universidad de los Andes | no       | Administración | dfdsfkjsf6 | yes        | "Ingresa tu correo"  |
      | dany             | dany     | dany@gmail.com    | Universidad de los Andes | no       | Administración |            | yes        | "Ingresa una contr"  |
      | dany             | dany     | dany@gmail.com    | Universidad de los Andes | no       | Administración | danlsdfy6  |            | "Debes aceptar"  |

Scenario Outline: Registration success

  Given I go to losestudiantes home screen
    When I open the 'ingresar' screen
    And Put input with <name> with <lastname> with <email> with <university> with <maestria> with <undergrad> with <password> and <conditions>
    And I try to register
    Then I expect to see popup <success>

    Examples:
      | name             | lastname | email             | university               | maestria | undergrad      | password   | conditions | success              |
      | dany             | dany     | dddsany@gmail.com    | Universidad de los Andes | no       | Administración | dfskdfjsay6       | yes        | "Verifica tu correo y activa"  |

