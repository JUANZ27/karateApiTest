Feature: GET /usuarios - Listar usuarios

  Background:
    * url baseUrl
    * def schema = read('classpath:schemas/user-list.schema.json')

  Scenario: Listar usuarios exitosamente
    Given path usersPath
    When method GET
    Then status 200
    And match response == schema
    And match response.quantidade == '#number'
    And match response.usuarios == '#[]'