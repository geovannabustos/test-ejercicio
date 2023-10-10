@ignore
Feature: Buscar usuario

  Scenario: Buscar usuario
    Given url 'https://petstore.swagger.io/v2/user/'+username
    And header Content-Type = 'application/json'
    And header accept = 'application/json'
    When method GET
    Then status 200
    And match response.username == username