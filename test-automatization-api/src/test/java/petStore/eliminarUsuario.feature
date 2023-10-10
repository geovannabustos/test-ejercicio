@ignore
Feature: Eliminar usuario

  Scenario: Eliminar usuario
    Given url 'https://petstore.swagger.io/v2/user/'+username
    And header accept = 'application/json'
    When method DELETE
    Then status 200
    And match response ==
    """
    {
      "code": 200,
      "type": "unknown",
      "message": '#(username)'
    }
    """