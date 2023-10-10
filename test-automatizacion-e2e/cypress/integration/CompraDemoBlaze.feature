Feature: Compra de productos

  Realizar la compra de dos productos de la Store de Demo Blaze

  Scenario: Realizar la compra de dos productos
    Given agrego dos productos al carrito
    And visualizo los productos en el carrito
    When completo el formulario de compra
    And finalizo la compra
    Then se presentara el mensaje de confirmacion de la compra exitosa

