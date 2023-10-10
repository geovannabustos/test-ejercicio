@ignore
Feature: Creacion de usuarios

  Scenario: Crear usuario
    * def entrada =
    """
    {
      "id": '#(id)',
      "username": '#(username)',
      "firstName": '#(firstName)',
      "lastName": '#(lastName)',
      "email": '#(email)',
      "password": '#(password)',
      "phone": '#(phone)',
      "userStatus": '#(userStatus)',
    }
    """
    Given url 'https://petstore.swagger.io/v2/user'
    And header Content-Type = 'application/json'
    And header accept = 'application/json'
    And request entrada
    When method POST
    Then status 200
    And match response ==
    """
    {
      "code": 200,
      "type": "unknown",
      "message": '#string'
    }
    """
