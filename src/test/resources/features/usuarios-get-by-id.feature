Feature: GET /usuarios/{_id} - Buscar por ID

  Background:
    * url baseUrl
    * def byIdSchema = read('classpath:schemas/user-by-id.schema.json')

  Scenario: Buscar usuario por ID válido
  # Arrange: crear usuario
    * def user = dataGen.newUser(false)
    Given path usersPath
    And request user
    When method POST
    Then status 201
    * def userId = response._id

  # Act
    Given path usersPath, userId
    When method GET
    Then status 200
    And match response == byIdSchema
    And match response._id == userId
    And match response.email == user.email

  Scenario: Buscar usuario con ID inexistente
    Given path usersPath, 'ID_INEXISTENTE_123'
    When method GET
    Then status 400
    And match response.message contains 'Usuário não encontrado'