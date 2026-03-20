Feature: Flujo E2E CRUD Usuarios

  Background:
    * url baseUrl

  Scenario: CRUD completo
    * def user = dataGen.newUser(true)

  # Create
    Given path usersPath
    And request user
    When method POST
    Then status 201
    * def userId = response._id

  # Read by id
    Given path usersPath, userId
    When method GET
    Then status 200
    And match response._id == userId

  # Update
    * set user.nome = user.nome + ' E2E'
    Given path usersPath, userId
    And request user
    When method PUT
    Then status 200

  # Delete
    Given path usersPath, userId
    When method DELETE
    Then status 200

  # Confirm delete
    Given path usersPath, userId
    When method GET
    Then status 400
    And match response.message contains 'Usuário não encontrado'