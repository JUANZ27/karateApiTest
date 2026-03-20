Feature: POST /usuarios - Registrar usuario

  Background:
    * url baseUrl
    * def createdSchema = read('classpath:schemas/user-created.schema.json')

  Scenario: Crear usuario válido
    * def user = dataGen.newUser(true)
    Given path usersPath
    And request user
    When method POST
    Then status 201
    And match response == createdSchema
    And match response.message contains 'Cadastro realizado'

  Scenario: No permite crear usuario con email repetido
    * def user = dataGen.newUser(false)
    Given path usersPath
    And request user
    When method POST
    Then status 201
    * def id1 = response._id

  # intento duplicado
    Given path usersPath
    And request user
    When method POST
    Then status 400
    And match response.message contains 'Este email já está sendo usado'